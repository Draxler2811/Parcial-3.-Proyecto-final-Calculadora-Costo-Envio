import 'package:calculado_a_costo_envio/models/paquete.dart';

class EnvioService {
  double _tarifaBase = 50.0;
  double _tarifaPeso = 10.0;
  double _tarifaVolumen = 5.0;
  Map<String, double> _tarifasDestino = {
    'nacional': 1.0,
    'internacional': 1.5,
  };

  double calcularCostoEnvio(Paquete paquete) {
    double costoPeso = paquete.peso * _tarifaPeso;
    double costoVolumen = paquete.volumen() * _tarifaVolumen;
    double tarifaDestino = _tarifasDestino.containsKey(paquete.destino.toLowerCase())
        ? _tarifasDestino[paquete.destino.toLowerCase()]!
        : 1.0;
    return (_tarifaBase + costoPeso + costoVolumen) * tarifaDestino;
  }
}
