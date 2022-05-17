import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsnow/app/view/app.dart';
import 'package:newsnow/bootstrap.dart';
import 'package:newsnow/injections.dart';

Future<void> main() async {
  await dotenv.load();
  configureDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await bootstrap(
    () => DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode,
      builder: (context) => const App(),
    ),
  );
}
