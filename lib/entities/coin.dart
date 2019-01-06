import 'package:functional_bloc/data/cache/database_constants.dart';

class Coin {
  final int id;
  final String name;
  final String symbol;
  final String logo;
  final int maxSupply;
  final num circulatingSupply;

  Coin(this.id, this.name, this.symbol, this.logo, this.maxSupply,
      this.circulatingSupply);

  Coin.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        symbol = json['symbol'],
        logo = json['logo'] ?? '',
        maxSupply = json['max_supply'],
        circulatingSupply = json['circulating_supply'];

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      ID: id,
      NAME: name,
      SYMBOL: symbol,
      LOGO: logo,
      MAX_SUPPLY: maxSupply,
      CIRCULATING_SUPPLY: circulatingSupply,
    };

    return map;
  }

  Coin.fromMap(Map<String, dynamic> map)
      : id = map[ID],
        name = map[NAME],
        symbol = map[SYMBOL],
        logo = map[LOGO],
        maxSupply = map[MAX_SUPPLY],
        circulatingSupply = map[CIRCULATING_SUPPLY];
}
