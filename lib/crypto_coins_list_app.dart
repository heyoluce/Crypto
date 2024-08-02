import 'package:crypto/router/router.dart';
import 'package:crypto/theme/theme.dart';
import 'package:flutter/material.dart';

class Crypto extends StatelessWidget {
  const Crypto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: darkTheme,
      routes: routes,
    );
  }
}