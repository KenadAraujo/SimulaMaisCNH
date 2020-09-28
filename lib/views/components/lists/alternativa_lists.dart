import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simulamaiscnh/models/questao.dart';

class AlternativaList extends StatefulWidget {

  final Questao questao;
  AlternativaList({Key key, @required this.questao}) : super(key: key);

  @override
  _AlternativaListState createState() => _AlternativaListState(questao.gerarAlternativas());
}

class _AlternativaListState extends State<AlternativaList> {

  Map<String,String> alternativas = Map();

  _AlternativaListState(Map<String,String> alt){  this.alternativas = alt; }

  @override
  Widget build(BuildContext context) {
    var larguraDoCard = MediaQuery.of(context).size.width*0.8;
    return ListView.builder(
      itemCount: this.alternativas.length,
      itemBuilder: (BuildContext context, int index) {
        String key = this.alternativas.keys.elementAt(index);
        return GestureDetector(
          child: Card(
            elevation: 2,
            child: ClipPath(
              child: Container(
                width: larguraDoCard,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 5),
                    left: BorderSide(color: Colors.black, width: 5),
                    top: BorderSide(color: Colors.black, width: 5),
                    bottom: BorderSide(color: Colors.black, width: 5),),
                  color: Colors.yellow
                ),
                child: Text(
                  this.alternativas[key].toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
              ),
              clipper: 
                ShapeBorderClipper(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
                ),
          ),
        );
      }
    );
  }
}