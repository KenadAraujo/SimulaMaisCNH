import 'package:simulamaiscnh/dao/abstract_dao.dart';
import 'package:simulamaiscnh/dao/dao.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/models/questao_respondida.dart';
import 'package:sqflite/sqflite.dart';

class QuestaoRespondidaDAO extends AbstractDAO<QuestaoRespondida>{

  static final String tableName = "resposta_questao";

  Future<void> save(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.insert(tableName, toMap(modelo));
  }
  Future<void> update(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.update(tableName, toMap(modelo),where: "id = ?",whereArgs: [modelo.id]);
  }
  Future<void> delete(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.delete(tableName,where: "id = ?",whereArgs: [modelo.id]);
  }
  Future<QuestaoRespondida> find(int id) async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.query(tableName,where: "id = ?",whereArgs: [id]);
    if(map.isNotEmpty){
      return toModel(map[0]);
    }
    return null;
  }
  Future<List<QuestaoRespondida>> findAll() async{
    Database database = await DAO.instance.database;
    List<Map> map = await database.query(tableName);
    if(map.isNotEmpty){
      return toModelList(map);
    }else{
      return new List();
    }
  }

  QuestaoRespondida toModel(Map map){
    Questao questao = Questao();
    questao.id = map["questao_id"];
    
    QuestaoRespondida questaoRespondida = QuestaoRespondida();
    questaoRespondida.id = map["id"];
    questaoRespondida.questao = questao;
    questaoRespondida.alternativaRespondida = map["alternativa_respondida"];
    questaoRespondida.alternativaCorreta = map["alternativa_correta"];
    questaoRespondida.dataResposta = map["data_resposta"];
    questaoRespondida.categoria = map["categoria_da_questao"];
    return questaoRespondida;
  }
  List<QuestaoRespondida> toModelList(List<Map> map){
    List<QuestaoRespondida> questoesRespondidas = new List();
    map.forEach((dado) { 
      questoesRespondidas.add(toModel(dado));
    });
    return questoesRespondidas;
  }
  Map toMap(QuestaoRespondida model){
    return {
      "id": model.id,
      "questao_id":model.questao.id,
      "alternativa_respondida":model.alternativaRespondida,
      "alternativa_correta":model.alternativaCorreta,
      "data_resposta":model.dataResposta,
      "categoria_da_questao":model.categoria
    };
  }
}