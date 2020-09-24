class Questao{
  int id;
  String categoria;
  String imagem;
  String descricao;
  String alternativaA;
  String alternativaB;
  String alternativaC;
  String alternativaD;
  String alternativaE;
  String respostaCorreta;

  String toString(){
    return "${id}:${categoria}:${descricao}";
  }
}