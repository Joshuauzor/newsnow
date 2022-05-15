import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:newsnow/core/core.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          onGenerateRoute: generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
            ),
            primarySwatch: Colors.blue,
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.primaryColor,
            ),
            scaffoldBackgroundColor: AppColors.black,
          ),
          initialRoute: RouteName.onboarding,
        );
      },
    );
  }
}
