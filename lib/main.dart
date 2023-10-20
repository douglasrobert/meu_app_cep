import 'package:flutter/material.dart';
import 'package:meu_app_cep/cep_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cep = '';
  Map<String, dynamic>? _cepData;

  void _consultarCep() async {
    try {
      final data = await CepService.fetchCep(_cep);
      setState(() {
        _cepData = data;
      });
    } catch (e) {
      // Trate o erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de CEP'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _cep = value;
                });
              },
              decoration: InputDecoration(labelText: 'CEP'),
            ),
            ElevatedButton(
              onPressed: _consultarCep,
              child: Text('Consultar CEP'),
            ),
            if (_cepData != null)
              Column(
                children: [
                  Text('CEP: ${_cepData!['cep']}'),
                  Text('Logradouro: ${_cepData!['logradouro']}'),
                  Text('Bairro: ${_cepData!['bairro']}'),
                  Text('Cidade: ${_cepData!['localidade']}'),
                  Text('Estado: ${_cepData!['uf']}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
