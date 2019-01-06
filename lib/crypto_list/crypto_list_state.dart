import 'package:functional_bloc/entities/coin.dart';
import 'package:meta/meta.dart';

class CryptoListState {
  final bool isLoading;
  final List<Coin> coins;
  final String errorMessage;

  const CryptoListState(
      {@required this.isLoading, @required this.coins, this.errorMessage});

  factory CryptoListState.initial() =>
      CryptoListState(coins: [], errorMessage: '', isLoading: true);

  factory CryptoListState.success(List<Coin> coins) =>
      CryptoListState(coins: coins, errorMessage: '', isLoading: false);

  factory CryptoListState.error(String message) =>
      CryptoListState(coins: [], errorMessage: message, isLoading: false);
}
