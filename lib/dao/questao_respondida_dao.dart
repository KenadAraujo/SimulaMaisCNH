import 'package:simulamaiscnh/dao/abstract_dao.dart';
import 'package:simulamaiscnh/dao/dao.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/models/questao_respondida.dart';
import 'package:simulamaiscnh/models/simulado.dart';
import 'package:sqflite/sqflite.dart';

class QuestaoRespondidaDAO extends AbstractDAO<QuestaoRespondida>{

  static final String tableName = "resposta_questao";

  Future<void> save(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.insert(tableName, toMap(modelo));
  }
  Future<void> update(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.update(tableName, toMap(modelo),where: "id = ?",whereArgs: [modelo.getId()]);
  }
  Future<void> delete(QuestaoRespondida modelo) async{
    Database database = await DAO.instance.database;
    await database.delete(tableName,where: "id = ?",whereArgs: [modelo.getId()]);
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
    questao.setId(map["questao_id"]);
    
    Simulado simulado = null;
    int simulado_id = map["simulado_id"];
    if(simulado_id!=null){
      simulado = Simulado.build();
      simulado.setId(simulado_id);
      simulado.setDataSimulado(null);
    }

    QuestaoRespondida questaoRespondida = QuestaoRespondida();
    questaoRespondida.setId(map["id"]);
    questaoRespondida.setQuestao(questao);
    questaoRespondida.setAlternativaRespondida(map["alternativa_respondida"]);
    questaoRespondida.setAlternativaCorreta(map["alternativa_correta"]);
    questaoRespondida.setDataResposta(DateTime.tryParse(map["data_resposta"]));
    questaoRespondida.setCategoria(map["categoria_da_questao"]);
    return questaoRespondida;
  }
  List<QuestaoRespondida> toModelList(List<Map> map){
    List<QuestaoRespondida> questoesRespondidas = new List();
    map.forEach((dado) { 
      questoesRespondidas.add(toModel(dado));
    });
    return questoesRespondidas;
  }
  Map<String,dynamic> toMap(QuestaoRespondida model){
    int simulado_id = null;
    if(model.getSimulado()!=null){
      simulado_id = model.getSimulado().getId();
    }
    return {
      "id": model.getId(),
      "questao_id":model.getQuestao().getId(),
      "alternativa_respondida":model.getAlternativaRespondida(),
      "alternativa_correta":model.getAlternativaCorreta(),
      "data_resposta":model.getDataResposta().toString(),
      "categoria_da_questao":model.getCategoria(),
      "simulado_id":simulado_id
    };
  }
}