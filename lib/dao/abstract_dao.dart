abstract class AbstractDAO<T>{

  Future<void> save(T modelo);
  Future<void> update(T modelo);
  Future<void> delete(T modelo);
  Future<T> find(int id);
  Future<List<T>> findAll();

  T toModel(Map map);
  List<T> toModelList(List<Map> map);
  Map toMap(T model);
}