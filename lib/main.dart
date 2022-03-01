import 'package:consumindo_api/telas/lista_personagens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu aplicativo",
      home: ListaPersonagem(),
    );
  }

}


