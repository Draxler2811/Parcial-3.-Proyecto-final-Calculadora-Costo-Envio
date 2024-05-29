import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculado_a_costo_envio/models/paquete.dart';
import 'package:calculado_a_costo_envio/screens/AgregarPaquete.dart' as agregar;
import 'package:calculado_a_costo_envio/screens/EditarPaquete.dart' as editar;
import 'package:calculado_a_costo_envio/services/paqueteservice.dart';

class HomeEnvio extends StatefulWidget {
  @override
  _HomeEnvioState createState() => _HomeEnvioState();
}

class _HomeEnvioState extends State<HomeEnvio> {
  final PaqueteService _paqueteService = PaqueteService();
  List<Paquete> _paquetes = [];

  @override
  void initState() {
    super.initState();
    _cargarPaquetes();
  }

  Future<void> _cargarPaquetes() async {
    try {
      final paquetes = await _paqueteService.obtenerPaquetes();
      setState(() {
        _paquetes = paquetes;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

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
              CupertinoPageRoute(builder: (context) => agregar.AgregarPaqueteScreen()),
            );
            if (nuevoPaquete != null) {
              await _paqueteService.agregarPaquete(nuevoPaquete);
              _cargarPaquetes();
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
              childAspectRatio: 0.9,
            ),
            itemCount: _paquetes.length,
            itemBuilder: (context, index) {
              final paquete = _paquetes[index];
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
                        'Dimensiones: ${paquete.largo}x${paquete.ancho}x${paquete.alto} cm\nDestino: ${paquete.destino}',
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
                                CupertinoPageRoute(builder: (context) => editar.EditarPaqueteScreen(paquete: paquete, index: index)),
                              );
                              if (paqueteEditado != null) {
                                await _paqueteService.actualizarPaquete(paquete.id!, paqueteEditado);
                                _cargarPaquetes();
                              }
                            },
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () async {
                              await _paqueteService.eliminarPaquete(paquete.id!);
                              _cargarPaquetes();
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
