import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/views/questao_view.dart';

class CategoriasList extends StatefulWidget {
  @override
  _CategoriasListState createState() => _CategoriasListState();
}

class _CategoriasListState extends State<CategoriasList> {

  List<String> _categorias = List();
  
  @override
  void initState() {
    super.initState();

    QuestaoDAO questaoDAO = QuestaoDAO();
    questaoDAO.getCategorias().then((list) {
      setState(() {
        this._categorias = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var larguraDoCard = MediaQuery.of(context).size.width*0.8;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: this._categorias.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 2,
            child: ClipPath(
              child: Container(
                width: larguraDoCard,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 5),
                    left: BorderSide(color: Colors.black, width: 5),
                    top: BorderSide(color: Colors.black, width: 5),
                    bottom: BorderSide(color: Colors.black, width: 5),),
                  color: Colors.yellow
                ),
                child: Text(
                  _categorias[index].toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
              ),
              clipper: 
                ShapeBorderClipper(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
                ),
          ),
          onTap: () =>{
            _redirecionarParaQuestoes(this._categorias[index])
          },
        );
      }
    );
  }

  _redirecionarParaQuestoes(String categoria){
    QuestaoDAO questaoDAO = QuestaoDAO();
    questaoDAO.quantidadeQuestoesNaoResolvidas(categoria).then((qnt) =>{
      if(qnt>0){
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestaoView(categoria: categoria)
              ))
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Não há questões não respondidas nessa categoria!"),
        ))
      }
    });
  }
}