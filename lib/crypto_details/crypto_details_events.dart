abstract class CryptoDetailsEvent {}

class FetchCoin extends CryptoDetailsEvent {
  final int coinId;

  FetchCoin(this.coinId);
}