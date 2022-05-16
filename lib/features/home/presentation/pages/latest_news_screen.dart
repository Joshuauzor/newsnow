import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/bootstrap.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/time_utils.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/features/home/presentation/cubit/latest_news_state.dart';
import 'package:newsnow/injections.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({Key? key}) : super(key: key);

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LatestNewsCubit>(
      create: (context) => LatestNewsCubit(
        latestNewsUseCase: sl<LatestNewsUseCase>(),
      )..getLatestNews(context),
      child: Scaffold(
        body: BlocBuilder<LatestNewsCubit, LatestNewsState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: CustomCircularProgressIndicator(),
                );
              },
              loaded: (latestNews) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText('Latest News'),
                        const Gap(8),
                        TextBody(
                          'Latest updates around the world',
                          color: AppColors.white,
                        ),
                        const Gap(24),
                        Searchbar(searchController: _searchController),
                        const Gap(37),
                        Expanded(
                          child: ListView.builder(
                            itemCount: latestNews.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = latestNews[index];
                              return TrendingList(
                                title: item.title,
                                description: item.description,
                                author: item.author!,
                                image: item.urlToImage!,
                                ago: '${TimeUtils.ago(item.publishedAt!)} ago',
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TrendingList extends StatelessWidget {
  const TrendingList({
    required this.title,
    required this.description,
    required this.author,
    required this.image,
    required this.ago,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final String author;
  final String image;
  final String ago;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRegular(
                title,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.kAsh,
              ),
              const Gap(9),
              TextBody(
                description,
                fontSize: 14,
                color: AppColors.kDarkerAsh,
              ),
              const Gap(20),
              Row(
                children: [
                  TextBody(
                    ago,
                    fontSize: 12,
                    color: AppColors.kDarkestAsh,
                  ),
                  const Gap(16),
                  TextBody(
                    author,
                    fontSize: 12,
                    color: AppColors.kDarkestAsh,
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (
                context,
                imageProvider,
              ) {
                return Container(
                  width: 118,
                  height: 132,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
              placeholder: (context, url) => Image.asset(
                AppAsset.dark,
                width: 118,
                height: 132,
              ),
              errorWidget: (
                context,
                url,
                error,
              ) =>
                  Image.asset(
                AppAsset.dark,
              ),
            ),
            const Gap(18),
            Row(
              children: [
                SvgPicture.asset(AppAsset.share),
                const Gap(34.7),
                SvgPicture.asset(AppAsset.pocket),
              ],
            ),
          ],
        )
      ],
    );
  }
}
