import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:newsnow/injections.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(sl);
