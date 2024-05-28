import 'package:calculado_a_costo_envio/models/paquete.dart';

class PaqueteService {
  List<Paquete> _paquetes = [];

  void agregarPaquete(Paquete paquete) {
    _paquetes.add(paquete);
  }

  List<Paquete> obtenerPaquetes() {
    return List.from(_paquetes);
  }

  void actualizarPaquete(int index, Paquete paquete) {
    _paquetes[index] = paquete;
  }

  void eliminarPaquete(int index) {
    _paquetes.removeAt(index);
  }
}
