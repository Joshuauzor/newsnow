import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsnow/app/app.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/injections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        newsUseCase: sl<NewsUseCase>(),
      )..getNews(context),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            },
            loaded: (news) {
              return Center(
                child: Text(
                  'Loaded',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
