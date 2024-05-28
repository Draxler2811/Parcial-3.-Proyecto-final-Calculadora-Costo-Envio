import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';

class PackageCard extends StatelessWidget {
  final Paquete paquete;

  const PackageCard({
    Key? key,
    required this.paquete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Peso: ${paquete.peso} kg'),
          Text('Dimensiones: ${paquete.largo} x ${paquete.ancho} x ${paquete.alto} cm'),
          Text('Destino: ${paquete.destino}'),
        ],
      ),
    );
  }
}
