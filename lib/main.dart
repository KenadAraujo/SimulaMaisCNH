import 'package:flutter/material.dart';
import 'package:simulamaiscnh/views/categoria_view.dart';
import 'package:simulamaiscnh/views/home_view.dart';
import 'package:simulamaiscnh/views/questao_view.dart';
import 'package:simulamaiscnh/views/splash_view.dart';

void main() {
  runApp(MaterialApp(
    title: "Simula mais CNH",
    home: SplashView(),
    routes: {
      '/splash-view':(context) => SplashView(),
      '/home':(context) => HomeView(),
      '/categorias':(context) => CategoriaView(),
      '/questao':(context) => QuestaoView()
    })
  );
}
