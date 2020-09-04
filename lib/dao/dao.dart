import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DAO{
  
  static final String _databaseNameAssets = "assets/db/simulamaiscnh.db";
  static final String _databaseName = "simulamaiscnh.db";
  
  DAO._privateContructor();
  static final DAO instance = DAO._privateContructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future _initDatabase() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _databaseNameAssets);

    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
        
      // Copy from asset
      ByteData data = await rootBundle.load(join(_databaseNameAssets, _databaseName));
      List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // open the database
    _database = await openDatabase(path, readOnly: true);
  }
}