import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';


class AgregarPaqueteScreen extends StatefulWidget {
  const AgregarPaqueteScreen({Key? key}) : super(key: key);

  @override
  _AgregarPaqueteScreenState createState() => _AgregarPaqueteScreenState();
}

class _AgregarPaqueteScreenState extends State<AgregarPaqueteScreen> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _largoController = TextEditingController();
  final TextEditingController _anchoController = TextEditingController();
  final TextEditingController _altoController = TextEditingController();
  final TextEditingController _destinoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Agregar Paquete',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      child: Container(
        color: Colors.blue.shade900, // Color del fondo de toda la pantalla
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height, // Altura total del dispositivo
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 80), // Espacio adicional para evitar que los campos sean tapados
                  CupertinoTextField(
                    controller: _pesoController,
                    placeholder: 'Peso (kg)',
                    keyboardType: TextInputType.number,
                    placeholderStyle: TextStyle(color: Colors.white70),
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    controller: _largoController,
                    placeholder: 'Largo (cm)',
                    keyboardType: TextInputType.number,
                    placeholderStyle: TextStyle(color: Colors.white70),
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    controller: _anchoController,
                    placeholder: 'Ancho (cm)',
                    keyboardType: TextInputType.number,
                    placeholderStyle: TextStyle(color: Colors.white70),
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    controller: _altoController,
                    placeholder: 'Alto (cm)',
                    keyboardType: TextInputType.number,
                    placeholderStyle: TextStyle(color: Colors.white70),
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    controller: _destinoController,
                    placeholder: 'Destino',
                    placeholderStyle: TextStyle(color: Colors.white70),
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: CupertinoButton.filled(
                      child: Text('Agregar'),
                      onPressed: () {
                        final nuevoPaquete = Paquete(
                          peso: double.parse(_pesoController.text),
                          largo: double.parse(_largoController.text),
                          ancho: double.parse(_anchoController.text),
                          alto: double.parse(_altoController.text),
                          destino: _destinoController.text,
                        );
                        Navigator.pop(context, nuevoPaquete);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}