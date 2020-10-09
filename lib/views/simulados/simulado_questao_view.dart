

import 'package:flutter/material.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/models/questao_respondida.dart';

class SimuladoQuestaoView extends StatelessWidget {
  
  Map<String,dynamic> _simulado = Map();
  List<Questao> _questoesASeremRespondidas;
  List<QuestaoRespondida> _questoesRespondidas;

  SimuladoQuestaoView.build(Map simulado,List<Questao> questoesASeremRespondidas, List<QuestaoRespondida> questoesRespondidas){
    this._simulado = simulado;
    this._questoesASeremRespondidas = questoesASeremRespondidas;
    this._questoesRespondidas = questoesRespondidas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imagens/background.png"),
              fit: BoxFit.cover)
          ),
          child: Column()
        )
    );
  }
}