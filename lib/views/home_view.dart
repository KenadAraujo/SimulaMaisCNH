import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/utils/icons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  void buscarTodosAsQuestoes() async{
    QuestaoDAO questaoDAO = new QuestaoDAO();
    print(await questaoDAO.findAll());
  }
  
  @override
  Widget build(BuildContext context) {
    buscarTodosAsQuestoes();
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
                Image.asset('assets/imagens/questoes.png'),
                Image.asset('assets/imagens/simulados.png')
              ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('assets/imagens/progresso.png'),
                Image.asset('assets/imagens/placas.png')
              ],)
          ],
        ),
      )
    );
  }
}