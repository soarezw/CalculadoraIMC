import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        primarySwatch: Colors.pink,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _peso = 0;
  double _altura = 0;

  // Variável para armazenar o resultado do IMC
  double _result = 0;

  String _tabela = '';

  // Função para calcular o IMC
  void _calcularIMC() {
    setState(() {
      _result = (_peso / (_altura * _altura)) * 10000;

      if (_result < 18.5) {
        _tabela = 'Baixo Peso';
      } else if (_result > 18.6 && _result < 24.9) {
        _tabela = 'Peso Normal.';
      } else if (_result > 25 && _result < 29.9) {
        _tabela = 'Sobrepeso';
      } else if (_result > 30 && _result < 34.9) {
        _tabela = 'Obesidade grau I.';
      } else if (_result > 35 && _result < 39.9) {
        _tabela = 'Obesidade grau II. ';
      } else {
        _tabela = 'ALERTA!!!💀';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcule seu IMC',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o peso
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (Kg):'),
              onChanged: (value) {
                _peso = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm):'),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),

            // Botão para calcular o IMC
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),

            SizedBox(height: 2.0),
            Text(
              'Resultado: ${_result.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _tabela,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Giovanna Cristina n°09 - Lana n°19',
            ),
          ],
        ),
      ),
    );
  }
}
