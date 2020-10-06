import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simulamaiscnh/dao/questao_dao.dart';
import 'package:simulamaiscnh/views/categoria_view.dart';
import 'package:simulamaiscnh/views/home_view.dart';
import 'package:simulamaiscnh/views/questao_view.dart';
import 'package:simulamaiscnh/views/simulado_home_view.dart';
import 'package:simulamaiscnh/views/splash_view.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    
    return MaterialApp(
    title: "Simula mais CNH",
    debugShowCheckedModeBanner: false,
    home: SplashView(),
    routes: {
      '/splash-view':(context) => SplashView(),
      '/home':(context) => HomeView(),
      '/categorias':(context) => CategoriaView(),
      '/questao':(context) => QuestaoView(),
      '/simulado_home':(context) => SimuladoHomeView()
    });
  }
}
