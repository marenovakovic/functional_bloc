import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_bloc/crypto_details/crypto_details_bloc.dart';
import 'package:functional_bloc/crypto_details/crypto_details_state.dart';

class CryptoDetailsRoute extends StatefulWidget {
  final int coinId;

  const CryptoDetailsRoute({Key key, this.coinId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CryptoDetailsState();
}

class _CryptoDetailsState extends State<CryptoDetailsRoute> {
  final _cryptoDetailsBloc = CryptoDetailsBloc();

  @override
  void initState() {
    _cryptoDetailsBloc.fetchCoin(widget.coinId);
    super.initState();
  }

  @override
  void dispose() {
    _cryptoDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = BlocBuilder(
      bloc: _cryptoDetailsBloc,
      builder: (context, CryptoDetailsState state) => Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: state.isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: <Widget>[
                        Image.network(
                          state.coin.logo,
                          width: 100.0,
                          height: 100.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(state.coin.name),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(state.coin.symbol),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(state.coin.maxSupply.toString()),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(state.coin.circulatingSupply.toString()),
                        ),
                      ],
                    ),
            ),
          ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: body,
    );
  }
}
