import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimuladoCategoriasList extends StatefulWidget {

  Map<String,dynamic> _simulado = Map();

  SimuladoCategoriasList(Map<String,dynamic> simulado){
    this._simulado = simulado;
  }

  @override
  _SimuladoCategoriasListState createState() => _SimuladoCategoriasListState(_simulado);
}

class _SimuladoCategoriasListState extends State<SimuladoCategoriasList> {

  Map<String,dynamic> _simulado = Map();

  _SimuladoCategoriasListState(Map<String,dynamic> simulado){
    this._simulado = simulado;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: this._simulado.length,
      itemBuilder: (BuildContext context, int index) {
        String key = this._simulado.keys.elementAt(index);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key.toUpperCase(),
              style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    )),
            Text(this._simulado[key].toString(),
                  style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ))
        ],);
      });
  }
}