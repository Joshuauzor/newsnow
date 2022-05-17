import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/bootstrap.dart';
import 'package:newsnow/core/constant/navigators/navigators.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/time_utils.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/features/home/presentation/cubit/latest_news_state.dart';
import 'package:newsnow/features/home/presentation/pages/read_news_screen.dart';
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
                                ago: item.publishedAt!,
                                content: item.content!,
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
