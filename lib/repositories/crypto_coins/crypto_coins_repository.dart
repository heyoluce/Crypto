import "package:crypto/repositories/crypto_coins/crypto_coins.dart";
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,LTC,XLM,ADA,SOL,V&tsyms=USD",
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
      (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;

      final fullPrice = usdData['PRICE'] as num;
      final price = double.parse(fullPrice.toStringAsFixed(3));

      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();

    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD");

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final fullPrice = usdData['PRICE'] as num;
    final price = double.parse(fullPrice.toStringAsFixed(3));
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final highest = usdData['HIGH24HOUR'];
    final high24Hour = double.parse(highest.toStringAsFixed(3));
    final lowest = usdData['LOW24HOUR'];
    final low24Hour= double.parse(lowest.toStringAsFixed(3));

    return CryptoCoinDetail(
        name: currencyCode,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        toSymbol: toSymbol,
        lastUpdate: lastUpdate,
        high24Hour: high24Hour,
        low24Hour: low24Hour);
  }
}
