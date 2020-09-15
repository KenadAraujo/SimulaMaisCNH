abstract class API<T>{
  static final String URL_BASE = "https://simula-mais.herokuapp.com/";

  Future<T> get(String url, Map parameter){
    return null;
  }
  Future<List<T>> getAll(String url, Map parameter){
    return null;
  }
  Future<bool> post(String url,Map parameter) async{
    return false;
  }
  Future<bool> delete(String url, Map parameter) async{
    return false;
  }
}