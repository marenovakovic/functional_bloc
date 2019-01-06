import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_bloc/crypto_details/crypto_datails_route.dart';
import 'package:functional_bloc/crypto_list/crypto_list_bloc.dart';
import 'package:functional_bloc/crypto_list/crypto_list_state.dart';

class CryptoListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoListRoute> {
  final CryptoListBloc _cryptoListBloc = CryptoListBloc();

  _CryptoListState() {
    _cryptoListBloc.fetch();
  }

  @override
  void dispose() {
    _cryptoListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Title'),
    );

    final body = BlocBuilder(
      bloc: _cryptoListBloc,
      builder: (context, CryptoListState state) {
        if (state.isLoading) return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: state.coins.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CryptoDetailsRoute(
                              coinId: state.coins[index].id,
                            )));
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(state.coins[index].name),
                ),
              ),
            );
          },
        );
      },
    );

    return BlocProvider(
      bloc: _cryptoListBloc,
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
