import 'package:simulamaiscnh/dao/abstract_dao.dart';
import 'package:simulamaiscnh/dao/dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:sqflite/sqflite.dart';

class QuestaoDAO extends AbstractDAO<Questao>{

  static final String tableName = "questions";

  Future<void> save(Questao modelo){

  }
  Future<void> update(Questao modelo){

  }
  Future<void> delete(Questao modelo){

  }
  Future<Questao> find(int id){

  }
  Future<List<Questao>> findAll() async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.query(tableName);
    if(map.isNotEmpty){
      return toModelList(map);
    }else{
      return new List();
    }
  }

  Questao toModel(Map map){
    Questao questao = new Questao();
    questao.id = map['id'];
    questao.tipo = map['type'];
    questao.categoria = map['category'];
    questao.imagem = map['image'];
    questao.descricao = map['question'];
    questao.alternativaA = map['answerA'];
    questao.alternativaB = map['answerB'];
    questao.alternativaC = map['answerC'];
    questao.alternativaD = map['answerD'];
    questao.alternativaE = map['answerE'];
    questao.respostaCorreta = map['correctAnswer'];
    return questao;
  }
  List<Questao> toModelList(List<Map> map){
    List<Questao> questoes = new List();
    map.forEach((dado) { 
      questoes.add(toModel(dado));
    });
    return questoes;
  }
  Map toMap(Questao model){
    return {
      "id": model.id,
      "type": model.tipo,
      "category": model.categoria,
      "image": model.imagem,
      "question":model.descricao,
      "answerA":model.alternativaA,
      "answerB":model.alternativaB,
      "answerC":model.alternativaC,
      "answerD":model.alternativaD,
      "answerE":model.alternativaE,
      "correctAnswer":model.respostaCorreta
    };
  }
}