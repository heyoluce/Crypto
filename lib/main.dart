import 'dart:io';

import 'package:crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_list_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  GetIt.I.registerLazySingleton(() => CryptoCoinsRepository(dio: Dio()));
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Crypto());
}
