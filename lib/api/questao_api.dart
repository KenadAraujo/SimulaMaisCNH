import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:simulamaiscnh/api/api.dart';
import 'package:simulamaiscnh/models/questao.dart';

class QuestaoAPI{

  Future<List<Questao>> get(int pagina) async{
    List questoesMap = await API().get(API.URL_BASE,API.URL_QUESTOES,null,gerarUrlDasQuestoes(pagina));
    List<Questao> questoes = toModel(questoesMap);
    return questoes;
  }

  Future<int> quantidadeQuestoes() async{
    int quantidade =  await API().count(API.URL_BASE,API.URL_QUESTOES);
    return quantidade;
  }

  Map gerarUrlDasQuestoes(int pagina){
    return <String,String>{
      "paginaNumero":pagina.toString()
    };
  }

  List<Questao> toModel(List questoes){
    List<Questao> questoesModel = List();
    questoes.forEach((questao) {
      Questao q = Questao();
      q.id = questao['id'];
      //print(q.id);
      q.categoria = questao['categoria'];
      q.descricao = questao['descricao'];
      q.imagem = questao['imagem'];
      q.alternativaA = questao['alternativaA'];
      q.alternativaB = questao['alternativaB'];
      q.alternativaC = questao['alternativaC'];
      q.alternativaD = questao['alternativaD'];
      q.alternativaE = questao['alternativaE'];
      q.respostaCorreta = questao['alternativaCorreta'];
      //print(q.toString());
      questoesModel.add(q);
    });
    return questoesModel;
  }
}