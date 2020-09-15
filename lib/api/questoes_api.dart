import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:simulamaiscnh/api/api.dart';
import 'package:simulamaiscnh/models/questao.dart';

class QuestoesAPI extends API<Questao>{

  Future<Questao> get(String url, Map parameter) async{
    var response = await http.get(API.URL_BASE+url);
    print(response.statusCode);
    Map<String,dynamic> dados = convert.jsonDecode(response.body);
    print(dados['content']);
    return null;
  }
  Future<List<Questao>> getAll(String url, Map parameter){
    return null;
  }
  Future<bool> post(String url,Map parameter) async{
    return false;
  }
  Future<bool> delete(String url, Map parameter) async{
    return false;
  }

  String gerarUrlDasQuestoes(int pagina){
    return "/questoes/?paginaNumero=${pagina}";
  }
}