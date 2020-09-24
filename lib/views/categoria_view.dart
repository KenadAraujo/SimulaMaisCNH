import 'package:flutter/material.dart';
import 'package:simulamaiscnh/views/components/lists/categorias_lists.dart';

class CategoriaView extends StatefulWidget {
  @override
  _CategoriaViewState createState() => _CategoriaViewState();
}

class _CategoriaViewState extends State<CategoriaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/background.png"),
            fit: BoxFit.cover)
        ),
        child: 
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,bottom: 10,left: 5,right: 5),
                      child: Text("Escolha uma categoria",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                      )
                  ]),
                Expanded(
                  child: SizedBox(
                    height: 200.0,
                    child:CategoriasList())
                )
            ])
        )
      );
  }
}