

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_crypto_project/features/crypto_coin/crypto_coin.dart';
import 'package:my_crypto_project/features/crypto_list/crypto_list.dart';
import 'package:my_crypto_project/repositories/crypto_coins/crypto_coins.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter  {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(page: CryptoListRoute.page, path: '/'),
        AutoRoute(page: CryptoCoinRoute.page, path: '/coin'),
      ];

}

