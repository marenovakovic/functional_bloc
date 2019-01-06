import 'package:dartz/dartz.dart';
import 'package:functional_bloc/data/cache/crypto_dao.dart';
import 'package:functional_bloc/data/crypto_repository.dart';
import 'package:functional_bloc/data/remote/crypto_service.dart';
import 'package:functional_bloc/entities/coin.dart';

class CryptoRepositoryImpl extends CryptoRepository {
  final CryptoService _coinsService;
  final CryptoDao _coinsDao;

  CryptoRepositoryImpl(this._coinsService, this._coinsDao);

  @override
  Future<Either<Exception, List<Coin>>> getCoins() async {
    Either<Exception, List<Coin>> result = await _coinsService.fetchCoins();

    return result.fold((e) async {
      return await _coinsDao.getCoins();
    }, (coins) async {
      await _coinsDao.saveCoins(coins);
      return result;
    });
  }

  @override
  Future<Either<Exception, Coin>> getCoin(int id) async {
    final cachedCoin = await _coinsDao.getCoin(id);

    final coin = cachedCoin.getOrElse(() {});
    if (coin.logo.isNotEmpty) return cachedCoin;

    final fetchedCoin = await _coinsService.fetchCoin(id);

    fetchedCoin.fold((e) {}, (coin) async => await _coinsDao.saveCoin(coin));

    return _coinsDao.getCoin(id);
  }
}
