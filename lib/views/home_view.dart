import 'package:flutter/material.dart';
import 'package:simulamaiscnh/api/questao_api.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/utils/icons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  void irParaCategorias(){
    Navigator.pushNamed(context, '/categorias');
  }
  void irParaSimulados(){
    Navigator.pushNamed(context, '/simulado_home');
  }
  void irParaProgressoDoUsuario(){

  }
  void irParaPlacas(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/background.png"),
            fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                    icon:Image.asset('assets/imagens/questoes.png'),
                    tooltip: 'Questões',
                    onPressed: irParaCategorias,
                    iconSize: 160.0,
                ),
                new IconButton(
                    icon:Image.asset('assets/imagens/simulados.png'),
                    tooltip: 'Simulados',
                    onPressed: irParaSimulados,
                    iconSize: 160.0,
                ),
              ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                    icon:Image.asset('assets/imagens/progresso.png'),
                    tooltip: 'Progresso',
                    onPressed: irParaProgressoDoUsuario,
                    iconSize: 160.0,
                ),
                new IconButton(
                    icon:Image.asset('assets/imagens/placas.png'),
                    tooltip: 'Placas',
                    onPressed: irParaPlacas,
                    iconSize: 160.0,
                ),
              ],),
          ],),
      )
    );
  }
}