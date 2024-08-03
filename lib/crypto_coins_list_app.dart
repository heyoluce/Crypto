import 'package:my_crypto_project/router/router.dart';
import 'package:my_crypto_project/theme/theme.dart';
import 'package:flutter/material.dart';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CryptoCurrenciesListAppState();
  }
}

class _CryptoCurrenciesListAppState extends State<Crypto> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CryptoCurrenciesList',
      theme: darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
