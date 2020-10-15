import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DAO{

  static final String _databaseName = "simula.db";
  static final int _databaseVersion = 1;

  DAO._privateContructor();
  static final DAO instance = DAO._privateContructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,_databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate
    );
  }
  Future _onCreate(Database db,int version) async{
    await db.execute('''
      CREATE TABLE questao (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
        categoria           VARCHAR (200),
        descricao           VARCHAR (500),
        imagem              VARCHAR (200),
        alternativa_A       VARCHAR (500),
        alternativa_B       VARCHAR (500),
        alternativa_C       VARCHAR (500),
        alternativa_D       VARCHAR (500),
        alternativa_E       VARCHAR (500),
        alternativa_correta VARCHAR (2) 
    );''');
    print("TABELA questao CRIADA!");
    await db.execute(''' CREATE TABLE resposta_questao (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
        questao_id             BIGINT        NOT NULL,
        alternativa_respondida VARCHAR (2),
        alternativa_correta    VARCHAR (2),
        data_resposta          DATETIME,
        categoria_da_questao   VARCHAR (200),
        simulado_id INTEGER 
    );''');
    print("TABELA resposta_questao CRIADA!");
    await db.execute(''' CREATE TABLE simulado (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
        data          DATETIME,
    );''');
    print("TABELA simulado CRIADA!");
  }
  Future _onUpgrade(Database db,int oldVersion, int newVersion) async{
    if(newVersion==2){
      await db.execute(''' CREATE TABLE IF NOT EXISTS resposta_questao (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
          questao_id             BIGINT        NOT NULL,
          alternativa_respondida VARCHAR (2),
          alternativa_correta    VARCHAR (2),
          data_resposta          DATETIME,
          categoria_da_questao   VARCHAR (200),
          simulado_id INTEGER
      );''');
      print("TABELA resposta_questao CRIADA!");
      await db.execute(''' CREATE TABLE simulado (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
        data          DATETIME,
      );''');
      print("TABELA simulado CRIADA!");
    }
  }
}