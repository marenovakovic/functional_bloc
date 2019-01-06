import 'package:bloc/bloc.dart';
import 'package:functional_bloc/crypto_details/crypto_details_events.dart';
import 'package:functional_bloc/crypto_details/crypto_details_state.dart';
import 'package:functional_bloc/data/crypto_repository.dart';
import 'package:functional_bloc/injection/injector.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  CryptoRepository _cryptoRepository = Injector().cryptoRepository;

  void fetchCoin(int coinId) {
    dispatch(FetchCoin(coinId));
  }

  @override
  CryptoDetailsState get initialState => CryptoDetailsState.initial();

  @override
  Stream<CryptoDetailsState> mapEventToState(
      CryptoDetailsState currentState, CryptoDetailsEvent event) async* {
    if (event is FetchCoin) {
      final coin = await _cryptoRepository.getCoin(event.coinId);

      yield coin.fold((e) => CryptoDetailsState.error(e.toString()),
          (coin) => CryptoDetailsState.success(coin));
    }
  }
}
