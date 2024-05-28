import 'package:calculado_a_costo_envio/models/paquete.dart';

class PaqueteService {
  List<Paquete> _paquetes = [];

  // Operación de Crear
  void agregarPaquete(Paquete paquete) {
    _paquetes.add(paquete);
  }

  // Operación de Leer
  List<Paquete> obtenerPaquetes() {
    return List.from(_paquetes);
  }

  // Operación de Actualizar
  void actualizarPaquete(int index, Paquete paquete) {
    _paquetes[index] = paquete;
  }

  // Operación de Eliminar
  void eliminarPaquete(int index) {
    _paquetes.removeAt(index);
}
}