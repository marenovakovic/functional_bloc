import 'package:functional_bloc/data/cache/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class CryptoDatabase {
  Database database;

  Future<void> open() async {
    database = await openDatabase('lib\data\cache\crypto_db.db',
        version: 1,
        onCreate: (Database db, int version) async =>
            await db.execute('''CREATE TABLE $TABLE_NAME (
            $ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $NAME TEXT UNIQUE NOT NULL,
            $SYMBOL TEXT UNIQUE NOT NULL,
            $LOGO TEXT,
            $MAX_SUPPLY INTEGER,
            $CIRCULATING_SUPPLY INTEGER
            )'''));
  }
}
