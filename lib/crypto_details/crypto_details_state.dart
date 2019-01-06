import 'package:functional_bloc/entities/coin.dart';
import 'package:meta/meta.dart';

class CryptoDetailsState {
  final bool isLoading;
  final Coin coin;
  final String errerMessage;

  const CryptoDetailsState(
      {@required this.isLoading, this.coin, this.errerMessage});

  factory CryptoDetailsState.initial() => CryptoDetailsState(isLoading: true);

  factory CryptoDetailsState.success(Coin coin) =>
      CryptoDetailsState(isLoading: false, coin: coin);

  factory CryptoDetailsState.error(String message) =>
      CryptoDetailsState(isLoading: false, errerMessage: message);
}
