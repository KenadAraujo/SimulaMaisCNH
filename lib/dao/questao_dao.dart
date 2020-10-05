import 'package:simulamaiscnh/dao/abstract_dao.dart';
import 'package:simulamaiscnh/dao/dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:sqflite/sqflite.dart';

class QuestaoDAO extends AbstractDAO<Questao>{

  static final String tableName = "questao";

  Future<void> save(Questao modelo) async{
    Database database = await DAO.instance.database;
    await database.insert(tableName, toMap(modelo));
  }
  Future<void> saveList(List<Questao> questoes){
    questoes.forEach((questao) {
      save(questao);
    });
  }
  Future<void> update(Questao modelo) async{
    Database database = await DAO.instance.database;
    await database.update(tableName, toMap(modelo),where: "id = ?",whereArgs: [modelo.getId()]);
  }
  Future<void> delete(Questao modelo) async{
    Database database = await DAO.instance.database;
    await database.delete(tableName,where: "id = ?",whereArgs: [modelo.getId()]);
  }
  Future<Questao> find(int id) async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.query(tableName,where: "id = ?",whereArgs: [id]);
    if(map.isNotEmpty){
      return toModel(map[0]);
    }
    return null;
  }
  Future<Questao> buscarQuestaoNaoRespondida(String categoria,int posicao) async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.rawQuery("select q.* from ${tableName} q where q.categoria = ? and q.id not in (select questao_id from resposta_questao where categoria = ? and alternativa_respondida = alternativa_correta) LIMIT ?",[categoria,categoria,posicao]);
    if(map.length>0){
      if(map[posicao-1] != null){
        //print(map[posicao-1]);
        return toModel(map[posicao-1]);
      }
    }
    return null;
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
  Future<int> quantidadeQuestoesNoBanco() async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.rawQuery("SELECT COUNT(id) as 'qnt_questoes' FROM ${tableName}");
    if(map.isNotEmpty){
      //print(map[0]["atual_em_caixa"]);
      if(map[0] == null){
        return 0;
      }
      return map[0]["qnt_questoes"].toInt();
    }
    return 0;
  }
  Future<List<String>> getCategorias() async{
    List<String> categorias = List();
    Database database = await DAO.instance.database;
    List<Map> map = await database.rawQuery("SELECT DISTINCT(categoria) as 'categoria' FROM ${tableName}");
    if(map.isNotEmpty){
      map.forEach((element) {
        //print(element['categoria']);
        categorias.add(element['categoria']);
      });
    }
    return categorias;
  }
  Questao toModel(Map map){
    Questao questao = new Questao();
    questao.setId(map['id']);
    questao.setCategoria(map['categoria']);
    questao.setImagem(map['imagem']);
    questao.setDescricao(map['descricao']);
    questao.setAlternativaA(map['alternativa_A']);
    questao.setAlternativaB(map['alternativa_B']);
    questao.setAlternativaC(map['alternativa_C']);
    questao.setAlternativaD(map['alternativa_D']);
    questao.setAlternativaE(map['alternativa_E']);
    questao.setRespostaCorreta(map['alternativa_correta']);
    return questao;
  }
  List<Questao> toModelList(List<Map> map){
    List<Questao> questoes = new List();
    map.forEach((dado) { 
      questoes.add(toModel(dado));
    });
    return questoes;
  }
  Map<String,dynamic> toMap(Questao model){
    return {
      "id": model.getId(),
      "categoria": model.getCategoria(),
      "imagem": model.getImagem(),
      "descricao":model.getDescricao(),
      "alternativa_A":model.getAlternativaA(),
      "alternativa_B":model.getAlternativaB(),
      "alternativa_C":model.getAlternativaC(),
      "alternativa_D":model.getAlternativaD(),
      "alternativa_E":model.getAlternativaE(),
      "alternativa_correta":model.getRespostaCorreta()
    };
  }
}