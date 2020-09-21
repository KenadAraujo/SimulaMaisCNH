import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API<T>{
  static final String URL_BASE = "https://simula-mais.herokuapp.com/";

  Future<List> get(String url, Map parameter) async{
    var response = await http.get(URL_BASE+url);
    if(response.statusCode == 200){
      Map<String,dynamic> dados = convert.jsonDecode(response.body);
      return dados['content'];
    }
    return List();
  }
  Future<int> count(String url) async{
    var response = await http.get(URL_BASE+url);
    if(response.statusCode == 200){
      Map<String,dynamic> dados = convert.jsonDecode(response.body);
      return dados['totalElements'];
    }
    return 0;
  }
  Future<bool> put(String url, Map parameter) async{
    return false;
  }

  Future<bool> post(String url,Map parameter) async{
    return false;
  }
  Future<bool> delete(String url, Map parameter) async{
    return false;
  }
}