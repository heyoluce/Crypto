import 'package:my_crypto_project/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:my_crypto_project/repositories/crypto_coins/models/crypto_coin_details.dart';

import 'crypto_coin_details.dart';


class CryptoCoin extends Equatable {
  const CryptoCoin(
      {required this.name,
      required this.details}
      );


  final String name;


  final CryptoCoinDetail details;

  @override
  List<Object?> get props => [name, details];
}
