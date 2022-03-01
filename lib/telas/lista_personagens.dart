

// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

import 'dart:convert';

import 'package:consumindo_api/data/personagem_api.dart';
import 'package:consumindo_api/model/personagem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:pretty_json/pretty_json.dart';

class ListaPersonagem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PersonagemListaState();
  }

}

class PersonagemListaState extends State<ListaPersonagem>{
  List<Personagem> personagensLista = <Personagem>[];

  void getpersonagensFromAPI() async{
    PersonagemAPI.getPersonagens().then((response){
    
        setState(() {
          var responseData = json.decode(response.body);
          Iterable lista = responseData['data'];
          personagensLista = lista.map((model) => Personagem.fromJson(model)).toList();
        });
    });
  }

  //método que vai pegar os personsagens

  @override
  void initState(){
    getpersonagensFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Animes"),
      ),

      body: Container(
        child: ListView.builder(
            itemCount: personagensLista.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(personagensLista[index].title),
                subtitle: Text(personagensLista[index].synopsis),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(personagensLista[index].images),
                 ),
              );
            }),
      ),
    );
  }

}