import 'package:dartz/dartz.dart';
import 'package:functional_bloc/data/remote/service.dart';
import 'package:functional_bloc/entities/coin.dart';

abstract class CryptoService {
  Future<Either<Exception, List<Coin>>> fetchCoins();
  Future<Either<Exception, Coin>> fetchCoin(int coinId);
}

class CryptoServiceImpl implements CryptoService {
  final _baseUrl = 'https://pro-api.coinmarketcap.com/v1/';
  final _service = Service();

  @override
  Future<Either<Exception, List<Coin>>> fetchCoins() async {
    try {
      final Map<String, dynamic> json =
          await _service.getJson(_baseUrl + 'cryptocurrency/listings/latest');
      final List<Coin> coins = [];

      json['data'].forEach((coin) => coins.add(Coin.fromJson(coin)));

      return right(coins);
    } on Exception catch (e) {
      print(e);

      return left(e);
    }
  }

  @override
  Future<Either<Exception, Coin>> fetchCoin(int coinId) async {
    try {
      final Map<String, dynamic> json =
          await _service.getJson(_baseUrl + 'cryptocurrency/info?id=$coinId');

      final Map<String, dynamic> data = json['data'];
      final MapEntry<String, dynamic> coinJson = data.entries.first;

      return right(Coin.fromJson(coinJson.value));
    } on Exception catch (e) {
      return left(e);
    }
  }
}
