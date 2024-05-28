import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';
import 'package:calculado_a_costo_envio/services/envio_service.dart';
import 'package:calculado_a_costo_envio/screens/AgregarPaquete.dart';
import 'package:calculado_a_costo_envio/screens/EditarPaquete.dart';
import 'package:calculado_a_costo_envio/services/paqueteservice.dart';

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
        middle: Text(
          'Calculadora de Costos de Envío',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.add, color: Colors.white),
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
      child: Container(
        color: Colors.blueGrey[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 3.0,
              childAspectRatio:0.9,
            ),
            itemCount: _paqueteService.obtenerPaquetes().length,
            itemBuilder: (context, index) {
              final paquete = _paqueteService.obtenerPaquetes()[index];
              return Card(
                color: Colors.blueGrey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(5.0),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Peso: ${paquete.peso} kg',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        'Dimensiones: ${paquete.largo}x${paquete.ancho}x${paquete.alto} cm\nDestino: ${paquete.destino}\nCosto de envío: ${EnvioService().calcularCostoEnvio(paquete)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.edit, color: Colors.orangeAccent),
                            onPressed: () async {
                              final paqueteEditado = await Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => EditarPaqueteScreen(paquete: paquete, index: index)),
                              );
                              if (paqueteEditado != null) {
                                setState(() {
                                  _paqueteService.actualizarPaquete(index, paqueteEditado);
                                });
                              }
                            },
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                _paqueteService.eliminarPaquete(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}