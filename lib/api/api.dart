import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API<T>{
  static final String URL_BASE = "simula-mais.herokuapp.com";
  static final String URL_QUESTOES = "/questoes";

  Map _header = <String, String>{
    HttpHeaders.contentTypeHeader:'application/json; charset=UTF-8',
  };

  Future<List> get(String url_base,String url_recurso, Map header, Map param) async{
    if(header!=null){
      _header.addAll(header);
    }
    var uri = Uri.https(url_base,url_recurso, param);
    var response = await http.get(uri,headers: _header,);
    if(response.statusCode == 200){
      Map<String,dynamic> dados = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      return dados['content'];
    }
    return List();
  }
  Future<int> count(String url_base,url_recurso) async{
    var uri = Uri.https(url_base, url_recurso,Map());
    var response = await http.get(uri,headers: _header);
    if(response.statusCode == 200){
      Map<String,dynamic> dados = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
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