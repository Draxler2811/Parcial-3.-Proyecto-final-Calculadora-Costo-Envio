import 'package:calculado_a_costo_envio/services/paqueteservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';
import 'package:calculado_a_costo_envio/services/envio_service.dart';
import 'package:calculado_a_costo_envio/screens/AgregarPaquete.dart';

class HomeEnvio extends StatefulWidget {
  @override
  _HomeEnvioState createState() => _HomeEnvioState();
}

class _HomeEnvioState extends State<HomeEnvio> {
  final PaqueteService _paqueteService = PaqueteService();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Calculadora de Costos de Envío'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.add),
          onPressed: () async {
            final nuevoPaquete = await Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AgregarPaqueteScreen()),
            );
            if (nuevoPaquete != null) {
              setState(() {
                _paqueteService.agregarPaquete(nuevoPaquete);
              });
            }
          },
        ),
      ),
      child: ListView.builder(
        itemCount: _paqueteService.obtenerPaquetes().length,
        itemBuilder: (context, index) {
          final paquete = _paqueteService.obtenerPaquetes()[index];
          return Card(
            child: ListTile(
              title: Text('Peso: ${paquete.peso} kg'),
              subtitle: Text('Dimensiones: ${paquete.largo}x${paquete.ancho}x${paquete.alto} cm\nDestino: ${paquete.destino}\nCosto de envío: ${EnvioService().calcularCostoEnvio(paquete)}'),
            ),
          );
        },
      ),
    );
  }
}
