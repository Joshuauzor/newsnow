import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/injections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      )..getNews(context),
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
                        HeaderText('Good Morning'),
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
                                const Hottopics(
                                  title:
                                      'Massa tortor nibh nulla condimentum imperdiet scelerisque...',
                                  ago: '2 hours ago',
                                  source: 'CNN UK',
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
                                          imageUrl: e.urlToImage!,
                                          title: e.title,
                                          ago: '1 hour ago',
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
