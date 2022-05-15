import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsnow/core/core.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    Future<dynamic>.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        RouteName.home,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAsset.appLogo,
        ),
      ),
    );
  }
}
