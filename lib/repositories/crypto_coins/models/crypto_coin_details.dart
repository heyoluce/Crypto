import 'package:crypto/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinDetail extends CryptoCoin {
  const CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
  });


  final String toSymbol;

  final Object lastUpdate;

  final double high24Hour;

  final double low24Hour;

  @override
  List<Object?> get props =>
      super.props
        ..addAll([
          toSymbol,
          lastUpdate,
          high24Hour,
          low24Hour,
        ]);
}