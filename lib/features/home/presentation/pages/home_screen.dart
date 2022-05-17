import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/greeting_utils.dart';
import 'package:newsnow/core/utils/string_utils.dart';
import 'package:newsnow/core/utils/time_utils.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/injections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    super.initState();
  }

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
                // ignore: omit_local_variable_types
                final List<News> _newsList = _searchText.isEmpty
                    ? news
                    : news
                        .where(
                          (item) =>
                              item.title.contains(
                                RegExp(
                                  StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false,
                                ),
                              ) ||
                              item.title.contains(
                                RegExp(
                                  StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false,
                                ),
                              ),
                        )
                        .toList();
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
                        Searchbar(
                          searchController: _searchController,
                        ),
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.readNews,
                                      arguments: ReadNewsScreenParams(
                                        title: news[0].title,
                                        description: news[0].description,
                                        author: news[0].source.name,
                                        image: news[0].urlToImage!,
                                        ago: news[0].publishedAt,
                                        content: news[0].content!,
                                      ),
                                    );
                                  },
                                  child: Hottopics(
                                    title: news[0].title,
                                    ago:
                                        '${TimeUtils.ago(news[0].publishedAt!)} ago',
                                    source: news[0].source.name,
                                    image: news[0].urlToImage,
                                  ),
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
                                if (_newsList.isNotEmpty)
                                  StaggeredGrid.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    children: _newsList
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                RouteName.readNews,
                                                arguments: ReadNewsScreenParams(
                                                  title: e.title,
                                                  description: e.description,
                                                  author: e.source.name,
                                                  image: e.urlToImage!,
                                                  ago: e.publishedAt,
                                                  content: e.content!,
                                                ),
                                              );
                                            },
                                            child: Latestnews(
                                              imageUrl: e.urlToImage,
                                              title: e.title,
                                              ago:
                                                  '${TimeUtils.ago(e.publishedAt!)} ago',
                                              source: e.source.name,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                else
                                  Center(
                                    child: TextBody(
                                      'No News Found',
                                      color: AppColors.white,
                                    ),
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
