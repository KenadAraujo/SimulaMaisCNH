import 'package:simulamaiscnh/dao/questao_respondida_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';

class QuestaoRespondida{
  int id;
  Questao questao;
  String alternativaRespondida;
  String alternativaCorreta;
  DateTime dataResposta;
  String categoria;

  QuestaoRespondida(){
    
  }

  QuestaoRespondida.build(Questao questao, String alternativaRespondida){
    this.questao = questao;
    this.alternativaRespondida = alternativaRespondida;
    this.alternativaCorreta = questao.getRespostaCorreta();
    this.dataResposta = DateTime.now();
    this.categoria = questao.getCategoria();
  }

  int getId(){
    return this.id;
  }
  void setId(int id){
    this.id = id;
  }

  Questao getQuestao(){
    return this.questao;
  }
  void setQuestao(Questao questao){
    this.questao = questao;
  }

  String getAlternativaRespondida(){
    return this.alternativaRespondida;
  }
  void setAlternativaRespondida(String alternativaRespondida){
    this.alternativaRespondida = alternativaRespondida;
  }

  String getAlternativaCorreta(){
    return this.alternativaCorreta;
  }
  void setAlternativaCorreta(String alternativaCorreta){
    this.alternativaCorreta = alternativaCorreta;
  }

  DateTime getDataResposta(){
    return this.dataResposta;
  }
  void setDataResposta(DateTime dataResposta){
    this.dataResposta = dataResposta;
  }

  String getCategoria(){
    return this.categoria;
  }
  void setCategoria(String categoria){
    this.categoria = categoria;
  }
}