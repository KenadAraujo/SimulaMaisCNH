import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/views/components/lists/simulado_categorias_list.dart';

class SimuladoHomeView extends StatefulWidget {
  
  @override
  _SimuladoHomeViewState createState() => _SimuladoHomeViewState();
}

class _SimuladoHomeViewState extends State<SimuladoHomeView> {

  Map<String,dynamic> _simulado = {
    "Meio ambiente":3,
    "Legislação de trânsito":12,
    "Direção defensiva":10,
    "Mecânica básica":2,
    "Medicina de tráfego":3
  };
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/background.png"),
            fit: BoxFit.cover)
        ),
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child:Text("Seu simulado será composto por 30 questões descritas abaixo, lembre-se que você tem 30 min para conclui-ló!",
                      maxLines: 15,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,),)
                ]),
                SizedBox(
                  height: 300,
                  child: SimuladoCategoriasList(_simulado),),
                Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Ink(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 5),
                            left: BorderSide(color: Colors.black, width: 5),
                            top: BorderSide(color: Colors.black, width: 5),
                            bottom: BorderSide(color: Colors.black, width: 5),),
                          color: Colors.yellow
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        iconSize: 34,
                        color: Colors.black,
                        onPressed: iniciar,
                      ),
                    ),
                  ),
                ),
            ])
      )
    );
  }
  iniciar(){

  }
}