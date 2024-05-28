import 'package:flutter/cupertino.dart';
import 'package:calculado_a_costo_envio/screens/home.dart';
import 'package:flutter/material.dart';

class EnvioApp extends StatelessWidget {
  const EnvioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de Costos de Envío",
      home: HomeEnvio(),
      theme: ThemeData(
        primaryColor: Colors.blue, // Cambia a tus preferencias de color
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}