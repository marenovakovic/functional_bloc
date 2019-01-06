import 'package:flutter/material.dart';
import 'package:functional_bloc/crypto_list/crypto_list_route.dart';
import 'package:functional_bloc/injection/injector.dart';

Future<void> main() async {
  await Injector().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: CryptoListRoute());
  }
}
