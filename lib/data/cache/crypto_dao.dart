import 'package:dartz/dartz.dart';
import 'package:functional_bloc/data/cache/database_constants.dart';
import 'package:functional_bloc/entities/coin.dart';
import 'package:sqflite/sqflite.dart';

class CryptoDao {
  final Database _database;

  CryptoDao(this._database);

  saveCoins(List<Coin> coins) {
    coins.forEach((coin) async => await _database.insert(
        TABLE_NAME, coin.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace));
  }

  saveCoin(Coin coin) async {
    await _database.insert(TABLE_NAME, coin.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Either<Exception, List<Coin>>> getCoins() async {
    try {
      final coinsMap = await _database.query(TABLE_NAME);
      final List<Coin> coins =
          coinsMap.map((map) => Coin.fromMap(map)).toList();

      return right(coins);
    } on Exception catch (e) {
      return left(e);
    }
  }

  Future<Either<Exception, Coin>> getCoin(int id) async {
    try {
      final coinsMap = await _database.query(TABLE_NAME,
          columns: [ID, NAME, SYMBOL, LOGO, MAX_SUPPLY, CIRCULATING_SUPPLY],
          where: '$ID = ?',
          whereArgs: [id]);
      final coin = coinsMap.map((map) => Coin.fromMap(map));

      return right(coin.first);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
