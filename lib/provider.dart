import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => CepStore()),
      ],
      child: MyApp(),
    ),
  );
}

class CepStore with Store {
  @observable
  List<Cep> ceps = [];

  @action
  void addCep(Cep cep) {
    ceps.add(cep);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/cepList': (context) => CepListPage(),
      },
    );
  }
}
