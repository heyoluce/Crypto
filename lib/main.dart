import 'dart:async';
import 'dart:io';
import 'package:my_crypto_project/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'crypto_coins_list_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  final talker = Talker();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Crypto application started!");

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
          printStateFullData: false, printEventFullData: false));

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );

  //await Hive.initFlutter();

  //final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  GetIt.I.registerLazySingleton(
      () => CryptoCoinsRepository(dio: dio));
  //cryptoCoinsBox: cryptoCoinsBox));

  HttpOverrides.global = MyHttpOverrides();

  runZonedGuarded(
      () => runApp(const Crypto()), (e, st) => GetIt.I<Talker>().handle(e, st));
}
