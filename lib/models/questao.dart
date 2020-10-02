class Questao{
  int _id;
  String _categoria;
  String _imagem;
  String _descricao;
  String _alternativaA;
  String _alternativaB;
  String _alternativaC;
  String _alternativaD;
  String _alternativaE;
  String _respostaCorreta;

  int getId(){
    return this._id;
  }
  void setId(int id){
    this._id = id;
  }

  String getCategoria(){
    return this._categoria;
  }
  void setCategoria(String categoria){
    this._categoria = categoria;
  }
  
  String getImagem(){
    return this._imagem;
  }
  void setImagem(String imagem){
    this._imagem = imagem;
  }

  String getDescricao(){
    return this._descricao;
  }
  void setDescricao(String descricao){
    this._descricao = descricao;
  }

  String getAlternativaA(){
    return this._alternativaA;
  }
  void setAlternativaA(String alternativaA){
    this._alternativaA = alternativaA;
  }

  String getAlternativaB(){
    return this._alternativaB;
  }
  void setAlternativaB(String alternativaB){
    this._alternativaB = alternativaB;
  }

  String getAlternativaC(){
    return this._alternativaC;
  }
  void setAlternativaC(String alternativaC){
    this._alternativaC = alternativaC;
  }

  String getAlternativaD(){
    return this._alternativaD;
  }
  void setAlternativaD(String alternativaD){
    this._alternativaD = alternativaD;
  }

  String getAlternativaE(){
    return this._alternativaE;
  }
  void setAlternativaE(String alternativaE){
    this._alternativaE = alternativaE;
  }

  String getRespostaCorreta(){
    return this._respostaCorreta;
  }
  void setRespostaCorreta(String respostaCorreta){
    this._respostaCorreta = respostaCorreta;
  }

  String toString(){
    return "${_id}:${_categoria}:${_descricao}";
  }

  Map<String,String> gerarAlternativas(){
    return {
      "A":this._alternativaA,
      "B":this._alternativaB,
      "C":this._alternativaC,
      "D":this._alternativaD,
      "E":this._alternativaE
    };
  }

  static bool responderQuestao(Questao questao,String alternativaRespondida){
    if(questao!=null){
      if(questao.getRespostaCorreta()==alternativaRespondida){
        //print("Alternativa correta");
        return true;
      }else{
        //print("Alternativa errada");
        return false;
      }
    }
  }
}