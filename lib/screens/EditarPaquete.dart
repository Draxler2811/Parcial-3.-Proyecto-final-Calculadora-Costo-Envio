import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';

class EditarPaqueteScreen extends StatefulWidget {
  final Paquete paquete;
  final int index;

  const EditarPaqueteScreen({Key? key, required this.paquete, required this.index}) : super(key: key);

  @override
  _EditarPaqueteScreenState createState() => _EditarPaqueteScreenState();
}

class _EditarPaqueteScreenState extends State<EditarPaqueteScreen> {
  late TextEditingController _pesoController;
  late TextEditingController _largoController;
  late TextEditingController _anchoController;
  late TextEditingController _altoController;
  late TextEditingController _destinoController;

  @override
  void initState() {
    super.initState();
    _pesoController = TextEditingController(text: widget.paquete.peso.toString());
    _largoController = TextEditingController(text: widget.paquete.largo.toString());
    _anchoController = TextEditingController(text: widget.paquete.ancho.toString());
    _altoController = TextEditingController(text: widget.paquete.alto.toString());
    _destinoController = TextEditingController(text: widget.paquete.destino);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Editar Paquete',
        style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: false,
      ),
      child: Container(
        color: Colors.blue.shade900,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 80),
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
                  CupertinoButton.filled(
                    child: Text('Guardar Cambios'),
                    onPressed: () {
                      final paqueteEditado = Paquete(
                        peso: double.parse(_pesoController.text),
                        largo: double.parse(_largoController.text),
                        ancho: double.parse(_anchoController.text),
                        alto: double.parse(_altoController.text),
                        destino: _destinoController.text,
                      );
                      Navigator.pop(context, paqueteEditado);
                    },
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