import 'package:simulamaiscnh/dao/questao_respondida_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/models/simulado.dart';

class QuestaoRespondida{
  int _id;
  Questao _questao;
  String _alternativaRespondida;
  String _alternativaCorreta;
  DateTime _dataResposta;
  String _categoria;
  Simulado _simulado;

  QuestaoRespondida(){
    
  }

  QuestaoRespondida.build(Questao questao, String alternativaRespondida){
    this._questao = questao;
    this._alternativaRespondida = alternativaRespondida;
    this._alternativaCorreta = questao.getRespostaCorreta();
    this._dataResposta = DateTime.now();
    this._categoria = questao.getCategoria();
    this._simulado = null;
  }

  int getId(){
    return this._id;
  }
  void setId(int id){
    this._id = id;
  }

  Questao getQuestao(){
    return this._questao;
  }
  void setQuestao(Questao questao){
    this._questao = questao;
  }

  String getAlternativaRespondida(){
    return this._alternativaRespondida;
  }
  void setAlternativaRespondida(String alternativaRespondida){
    this._alternativaRespondida = alternativaRespondida;
  }

  String getAlternativaCorreta(){
    return this._alternativaCorreta;
  }
  void setAlternativaCorreta(String alternativaCorreta){
    this._alternativaCorreta = alternativaCorreta;
  }

  DateTime getDataResposta(){
    return this._dataResposta;
  }
  void setDataResposta(DateTime dataResposta){
    this._dataResposta = dataResposta;
  }

  String getCategoria(){
    return this._categoria;
  }
  void setCategoria(String categoria){
    this._categoria = categoria;
  }

  Simulado getSimulado(){
    return this._simulado;
  }

  void setSimulado(Simulado simulado){
    this._simulado = simulado;
  }
}