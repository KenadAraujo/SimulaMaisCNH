import 'package:simulamaiscnh/dao/abstract_dao.dart';
import 'package:simulamaiscnh/models/simulado.dart';

class SimuladoDAO extends AbstractDAO<Simulado>{
  Future<void> save(Simulado modelo) async{
    return null;
  }
  Future<void> update(Simulado modelo) async{
    return null;
  }
  Future<void> delete(Simulado modelo) async{
    return null;
  }
  Future<Simulado> find(int id) async{
    return Simulado.build();
  }
  Future<List<Simulado>> findAll() async{

  }

  Simulado toModel(Map map){

  }
  List<Simulado> toModelList(List<Map> map){

  }
  Map<String,dynamic> toMap(Simulado model){
    
  }
}