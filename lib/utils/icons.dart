import 'package:flutter/material.dart';

class IconQuestoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/imagens/questoes.png',
            width: 80,),
          Text("Questoes",)
        ],),
      );
  }
}