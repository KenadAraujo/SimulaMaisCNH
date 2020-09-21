import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:simulamaiscnh/api/api.dart';
import 'package:simulamaiscnh/models/questao.dart';

class QuestaoAPI{

  Future<List<Questao>> get(int pagina) async{
    String url = gerarUrlDasQuestoes(pagina);
    List questoesMap = await API().get(url, null);
    List<Questao> questoes = toModel(questoesMap);
    return questoes;
  }

  Future<int> quantidadeQuestoes() async{
    int quantidade =  await API().count(gerarUrlDasQuestoes(0));
    return quantidade;
  }

  String gerarUrlDasQuestoes(int pagina){
    return "/questoes/?paginaNumero=${pagina}";
  }

  List<Questao> toModel(List questoes){
    List<Questao> questoesModel = List();
    questoes.forEach((questao) {
      Questao q = Questao();
      q.id = questao['id'];
      print(q.id);
      q.categoria = questao['categoria'];
      q.descricao = questao['descricao'];
      q.imagem = questao['imagem'];
      q.alternativaA = questao['alternativaA'];
      q.alternativaB = questao['alternativaB'];
      q.alternativaC = questao['alternativaC'];
      q.alternativaD = questao['alternativaD'];
      q.alternativaE = questao['alternativaE'];
      q.respostaCorreta = questao['alternativaCorreta'];
      questoesModel.add(q);
    });
    return questoesModel;
  }
}