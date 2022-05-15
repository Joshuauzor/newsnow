import 'package:flutter/material.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/features/home/presentation/pages/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.onboarding:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const OnboardingScreen(),
      );

    case RouteName.home:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeScreen(),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
