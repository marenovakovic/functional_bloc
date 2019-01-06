import 'package:dartz/dartz.dart';
import 'package:functional_bloc/entities/coin.dart';

abstract class CryptoRepository {

  Future<Either<Exception, List<Coin>>> getCoins();

  Future<Either<Exception, Coin>> getCoin(int id);
}