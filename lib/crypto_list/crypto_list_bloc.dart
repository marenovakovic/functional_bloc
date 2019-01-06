import 'package:bloc/bloc.dart';
import 'package:functional_bloc/crypto_list/crypto_list_state.dart';
import 'package:functional_bloc/data/crypto_repository.dart';
import 'package:functional_bloc/crypto_list/crypto_list_events.dart';
import 'package:functional_bloc/injection/injector.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoRepository _cryptoRepository = Injector().cryptoRepository;

  void fetch() => dispatch(FetchCoins());

  @override
  get initialState => CryptoListState.initial();

  @override
  Stream<CryptoListState> mapEventToState(
      currentState, CryptoListEvent event) async* {
    final coins = await _cryptoRepository.getCoins();

    yield coins.fold((e) => CryptoListState.error(e.toString()),
        (coins) => CryptoListState.success(coins));
  }
}
