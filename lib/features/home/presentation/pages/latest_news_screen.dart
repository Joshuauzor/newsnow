import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/string_utils.dart';
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
                // ignore: omit_local_variable_types
                final List<News> _newsList = _searchText.isEmpty
                    ? latestNews
                    : latestNews
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
                        HeaderText('Latest News'),
                        const Gap(8),
                        TextBody(
                          'Latest updates around the world',
                          color: AppColors.white,
                        ),
                        const Gap(24),
                        Searchbar(
                          searchController: _searchController,
                        ),
                        const Gap(37),
                        if (_newsList.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: _newsList.length,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = _newsList[index];
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
                        else
                          Center(
                            child: TextBody(
                              'Keyword not found',
                              color: AppColors.white,
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
