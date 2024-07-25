import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white10,
            titleTextStyle:
            TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w700)
        ),

        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/' : (context) => CryptoListScreen(),
        '/coin' : (context) => CryptoCoinScreen(),
      },

     // home: const CryptoListScreen(),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Crypto Currencies'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) =>
            ListTile(
              leading: SvgPicture.asset(
                'assets/bitcoin.svg',
                height: 30,
                width: 30,
              ),
              title: Text(
                'Bitcoin',
                style: theme.textTheme.bodyMedium,
              ),
              subtitle: Text(
                '12900\$',
                style: theme.textTheme.labelSmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
               Navigator.of(context).pushNamed('/coin');
              },
            ),
      ),
    );
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bitcoin')),
    );
  }
}


