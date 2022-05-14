import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();

  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
