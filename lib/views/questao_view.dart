import 'package:flutter/material.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';
import 'package:simulamaiscnh/views/components/lists/alternativa_lists.dart';
import 'package:simulamaiscnh/views/components/lists/categorias_lists.dart';

class QuestaoView extends StatefulWidget {
  
  final String categoria;
  int numeroQuestao = 1;

  QuestaoView({Key key, @required this.categoria}) : super(key: key);

  QuestaoView.criaEPegaAProximaQuestao({Key key,@required this.categoria,@required this.numeroQuestao}):super(key:key);

  @override
  _QuestaoViewState createState() => _QuestaoViewState(categoria,numeroQuestao);
}

class _QuestaoViewState extends State<QuestaoView> {
  
  QuestaoDAO questaoDAO = QuestaoDAO();

  Questao _questaoAtual = Questao();

  String cat;
  int numeroQuestao;
  _QuestaoViewState(String cat,int numeroQuestao){  
    this.cat = cat; 
    this.numeroQuestao = numeroQuestao;  
  }

  @override
  void initState() {
    super.initState();
    questaoDAO.buscarQuestaoNaoRespondida(this.cat,this.numeroQuestao).then((questao) => {
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
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Q${_questaoAtual.getId().toString()}",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    Text(this.cat,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                  ],),
                SizedBox(height: 10),
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
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    botaoAnterior(),
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
                            icon: Icon(Icons.home),
                            iconSize: 34,
                            color: Colors.black,
                            onPressed: home,
                          ),
                        ),
                      ),
                    ),
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
                            onPressed: screenPosterior,
                          ),
                        ),
                      ),
                    ),
                  ]
                )
                ],
            )
          ,)
        )
      );
  }
  
  void screenAnterior(){
    if(this.numeroQuestao>1){
      Navigator.pop(context);  
    }
  }
  void home(){
    Navigator.pushNamed(context, '/home');
  }
  void screenPosterior(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestaoView.criaEPegaAProximaQuestao(categoria: this.cat, numeroQuestao: this.numeroQuestao+1)
    ));
  }
  Widget botaoAnterior(){
    if(this.numeroQuestao!=1){
      return Material(
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
                    disabledColor: Colors.grey,
                    icon: Icon(Icons.navigate_before),
                    iconSize: 34,
                    color: Colors.black,
                    onPressed: screenAnterior,
                  ),
                ),
              ),
            );
    }
    return null;
  }
}