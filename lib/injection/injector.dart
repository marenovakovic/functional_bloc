import 'package:functional_bloc/data/cache/crypto_dao.dart';
import 'package:functional_bloc/data/cache/crypto_database.dart';
import 'package:functional_bloc/data/crypto_repository.dart';
import 'package:functional_bloc/data/crypto_repository_impl.dart';
import 'package:functional_bloc/data/remote/crypto_service.dart';

class Injector {

  static final Injector _instance = Injector._internal();

  final CryptoDatabase _cryptoDatabase = CryptoDatabase();
  CryptoDao _cryptoDao;
  CryptoRepository cryptoRepository;
  final CryptoService _cryptoService = CryptoServiceImpl();

  factory Injector() => _instance;

  Injector._internal();

  Future<void> init() async {
    await _cryptoDatabase.open();

    _cryptoDao = CryptoDao(_cryptoDatabase.database);
    cryptoRepository = CryptoRepositoryImpl(_cryptoService, _cryptoDao);
  }
}