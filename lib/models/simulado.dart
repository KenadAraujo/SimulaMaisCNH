

import 'package:simulamaiscnh/models/questao_respondida.dart';

class Simulado{

  int _id;
  DateTime _dataSimulado;
  List<QuestaoRespondida> _questoes = List();

  Simulado.build(){
    _dataSimulado = DateTime.now();
  }

  int getId(){
    return this._id;
  }
  void setId(int id){
    this._id = id;
  }
  DateTime getDataSimulado(){
    return this._dataSimulado;
  }
  void setDataSimulado(DateTime dataSimulado){
    this._dataSimulado = dataSimulado;
  }

  void addQuestao(QuestaoRespondida questao){
    questao.setSimulado(this);
    this._questoes.add(questao);
  }
}