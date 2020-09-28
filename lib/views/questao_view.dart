import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/views/components/lists/alternativa_lists.dart';
import 'package:simulamaiscnh/views/components/lists/categorias_lists.dart';

class QuestaoView extends StatefulWidget {
  
  final String categoria;

  QuestaoView({Key key, @required this.categoria}) : super(key: key);

  @override
  _QuestaoViewState createState() => _QuestaoViewState(categoria);
}

class _QuestaoViewState extends State<QuestaoView> {
  
  QuestaoDAO questaoDAO = QuestaoDAO();

  Questao _questaoAtual = Questao();

  String cat;
  
  _QuestaoViewState(String cat){  this.cat = cat; }

  @override
  void initState() {
    super.initState();
    questaoDAO.buscarQuestaoNaoRespondida(this.cat).then((questao) => {
      this.setState(() {
        if(questao!=null){
          this._questaoAtual = questao;
        }
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height*0.9;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imagens/background.png"),
              fit: BoxFit.cover)
          ),
          child: 
          Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Q${_questaoAtual.getId().toString()}",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                  ],),
                Row(children: [
                  Expanded(
                    child: Text(_questaoAtual.getDescricao(), 
                      maxLines: 15,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,),
                  ),
                ],),
                Expanded(
                  child: SizedBox(
                    height: altura,
                    child:AlternativaList(questao: this._questaoAtual))
                )
                ],
            )
          ,)
        )
      );
  }
}