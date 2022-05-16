import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/greeting_utils.dart';
import 'package:newsnow/core/utils/time_utils.dart';
import 'package:newsnow/features/features.dart';
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
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        newsUseCase: sl<NewsUseCase>(),
        latestNewsUseCase: sl<LatestNewsUseCase>(),
      )..getLatestNews(context),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: CustomCircularProgressIndicator(),
                );
              },
              loaded: (news) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText('Good ${TimeFmt.greeting()}'),
                        const Gap(8),
                        TextBody(
                          'Explore the world by one Tap',
                          color: AppColors.white,
                        ),
                        const Gap(24),
                        Searchbar(searchController: _searchController),
                        const Gap(16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(
                                  'Hot Topics',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36,
                                ),
                                const Gap(16),
                                Hottopics(
                                  title: news[0].title,
                                  ago: '2 hours ago',
                                  source: news[0].source.name,
                                  image: news[0].urlToImage,
                                ),
                                const Gap(40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HeaderText(
                                      'Latest News',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                                    SvgPicture.asset(AppAsset.play)
                                  ],
                                ),
                                const Gap(8),
                                StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  children: news
                                      .map(
                                        (e) => Latestnews(
                                          imageUrl: e.urlToImage,
                                          title: e.title,
                                          ago:
                                              '${TimeUtils.ago(e.publishedAt!)} ago',
                                          source: e.source.name,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
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