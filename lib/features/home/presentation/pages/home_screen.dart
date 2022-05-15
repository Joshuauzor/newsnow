import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(
        newsUseCase: sl<NewsUseCase>(),
      )..getNews(context),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Text(
                context.read<OnboardingCubit>().test!,
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
