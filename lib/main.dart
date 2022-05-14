import 'package:device_preview/device_preview.dart';
import 'package:newsnow/app/view/app.dart';
import 'package:newsnow/bootstrap.dart';
import 'package:newsnow/injections.dart';

Future<void> main() async {
  configureDependencies();
  await bootstrap(
    () => DevicePreview(
      builder: (context) => const App(),
    ),
  );
}
