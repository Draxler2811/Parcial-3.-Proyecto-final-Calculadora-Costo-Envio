import 'package:flutter/cupertino.dart';
import 'package:calculado_a_costo_envio/screens/home.dart';


class EnvioApp extends StatelessWidget {
  const EnvioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Calculadora de Costos de Envío",
      home: HomeEnvio(),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}