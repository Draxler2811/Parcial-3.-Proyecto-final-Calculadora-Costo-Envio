import 'package:calculado_a_costo_envio/models/paquete.dart';

class PaqueteService {
  final List<Paquete> _paquetes = [];

  List<Paquete> obtenerPaquetes() {
    return _paquetes;
  }

  void agregarPaquete(Paquete paquete) {
    _paquetes.add(paquete);
  }

  void actualizarPaquete(int index, Paquete paquete) {
    _paquetes[index] = paquete;
  }

  void eliminarPaquete(int index) {
    _paquetes.removeAt(index);
  }
}
