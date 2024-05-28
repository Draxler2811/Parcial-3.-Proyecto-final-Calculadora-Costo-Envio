import 'package:calculado_a_costo_envio/services/paqueteservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';
import 'package:calculado_a_costo_envio/services/envio_service.dart';
import 'package:calculado_a_costo_envio/widgets/input_field.dart';
import 'package:calculado_a_costo_envio/widgets/custome_button.dart';

class HomeEnvio extends StatefulWidget {
  const HomeEnvio({Key? key}) : super(key: key);

  @override
  _HomeEnvioState createState() => _HomeEnvioState();
}

class _HomeEnvioState extends State<HomeEnvio> {
  final _pesoController = TextEditingController();
  final _largoController = TextEditingController();
  final _anchoController = TextEditingController();
  final _altoController = TextEditingController();
  final _destinoController = TextEditingController();
  final _paqueteService = PaqueteService(); // Instancia del servicio
  double _costoEnvio = 0.0;

  void _calcularCosto() {
    try {
      final double peso = double.parse(_pesoController.text);
      final double largo = double.parse(_largoController.text);
      final double ancho = double.parse(_anchoController.text);
      final double alto = double.parse(_altoController.text);
      final String destino = _destinoController.text;

      final paquete = Paquete(
        peso: peso,
        largo: largo,
        ancho: ancho,
        alto: alto,
        destino: destino,
      );

      // Agregar el paquete al servicio
      _paqueteService.agregarPaquete(paquete);

      // Calcular el costo de envío
      final costo = EnvioService().calcularCostoEnvio(paquete);

      setState(() {
        _costoEnvio = costo;
      });
    } catch (e) {
      // Maneja errores de conversión y muestra un mensaje de error
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text('Por favor, ingresa valores válidos.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Calculadora de Costos de Envío'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20), // Espacio adicional para evitar solapamiento con el encabezado
            InputField(
              controller: _pesoController,
              placeholder: 'Peso (kg)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            InputField(
              controller: _largoController,
              placeholder: 'Largo (cm)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            InputField(
              controller: _anchoController,
              placeholder: 'Ancho (cm)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            InputField(
              controller: _altoController,
              placeholder: 'Alto (cm)',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            InputField(
              controller: _destinoController,
              placeholder: 'Destino',
            ),
            SizedBox(height: 20), // Espacio adicional entre los campos y el botón
            CustomButton(
              text: 'Calcular Costo',
              onPressed: _calcularCosto,
            ),
            SizedBox(height: 20), // Espacio adicional entre el botón y el resultado
            Text('Costo de Envío: \$$_costoEnvio'),
          ],
        ),
      ),
    );
  }
}