import 'package:flutter/material.dart';
import 'package:simulamaiscnh/api/questao_api.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/models/questao.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  List<Questao> paginaAtual = List<Questao>();
  bool carregarQuestoes = true;
  int _quantidadeQuestoes = 0;
  String _status = "Procurando questões no dispositivo...";

  void _carregarQuestoesDoBanco(){
    QuestaoDAO questaoDAO = QuestaoDAO();
    questaoDAO.findAll().then((value) => {
      if(value.isEmpty){
        this.setState(() {
          _status = "Baixando questões para o dispositivo...";
           _carregarQuestoesDaApi();
        })
      }else{
        this.setState(() {
          _status = "${value.length} questões adicionadas";
        })
      }  
    });
  }
  void _carregarQuestoesDaApi() async{
    QuestaoAPI questaoAPI = QuestaoAPI();
    QuestaoDAO questaoDAO = QuestaoDAO();
    this._quantidadeQuestoes = await questaoAPI.quantidadeQuestoes();
    int quantidadePaginas = (this._quantidadeQuestoes/10).round();
    for(int i=0;i<quantidadePaginas+1;i++){
      this.paginaAtual = await questaoAPI.get(i);
      questaoDAO.saveList(this.paginaAtual);
      this.setState(() {
        if((i*10)>=this._quantidadeQuestoes)
        {
          _status = "Baixando questão ${this._quantidadeQuestoes} de ${this._quantidadeQuestoes}";  
        }else{
          _status = "Baixando questão ${i*10} de ${this._quantidadeQuestoes}";
        }
        
      });
    }
    int quantidadeQuestoesAdicionadas = await questaoDAO.quantidadeQuestoesNoBanco();
    if(quantidadeQuestoesAdicionadas!=0){
      setState(() {
        _status = "${quantidadeQuestoesAdicionadas} questões adicionadas";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this._carregarQuestoesDoBanco();
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
                  Text(this._status)
                ],),
              ],
          )
        )
      );
  }
}