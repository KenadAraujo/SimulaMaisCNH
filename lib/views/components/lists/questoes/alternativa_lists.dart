import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_respondida_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/models/questao_respondida.dart';

class AlternativaList extends StatefulWidget {

  final Questao questao;
  AlternativaList({Key key, @required this.questao}) : super(key: key);

  @override
  _AlternativaListState createState() => _AlternativaListState(questao);
}

class _AlternativaListState extends State<AlternativaList> {

  Questao questao;

  Map<String,String> alternativas = Map();
  Map<String,Color> cores = Map();

  String questaoRespondida;

  _AlternativaListState(Questao questao){ 
    this.questao = questao;
    print(this.questao.toString());
    this.alternativas = questao.gerarAlternativas();

    this.alternativas.forEach((key, value) {
      cores[key] = Colors.yellow;
    });
  }

  @override
  Widget build(BuildContext context) {
    var larguraDoCard = MediaQuery.of(context).size.width*0.8;
    return ListView.builder(
      itemCount: this.alternativas.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String key = this.alternativas.keys.elementAt(index);
        return GestureDetector(
          onTap: (){
            this.questaoRespondida = key;
            responderQuestao(key);
          } ,
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
                  color: this.cores[key]
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
  void responderQuestao(String key){
    if(key!=null){
      setState(() {
        if(Questao.responderQuestao(questao, key)){
          //RESPONDIDA CORRETA
          this.cores[key] = Colors.green;
        }else{
          //RESPONDIDA ERRADA
          this.cores[key] = Colors.red;
        }
        QuestaoRespondidaDAO questaoRespondidaDAO = QuestaoRespondidaDAO();
        QuestaoRespondida qRespondida = QuestaoRespondida.build(questao, key);
        questaoRespondidaDAO.save(qRespondida);
      });
    }
  }
}