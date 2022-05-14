import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsnow/core/core.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            onGenerateRoute: generateRoute,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: AppColors.primaryColor,
              ),
              primarySwatch: Colors.blue,
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSwatch(
                accentColor: AppColors.primaryColor,
              ),
            ),
            initialRoute: RouteName.onboarding,
          );
        },
      ),
    );
  }
}
