import 'package:calculado_a_costo_envio/models/paquete.dart';

class EnvioService {
  double _tarifaBase = 50.0; // Tarifa base en pesos
  double _tarifaPeso = 10.0; // Tarifa por kilogramo en pesos
  double _tarifaVolumen = 5.0; // Tarifa por metro cúbico en pesos

  Map<String, double> _tarifasDestino = {
    'nacional': 1.0,
    'internacional': 1.5,
  };

  double calcularCostoEnvio(Paquete paquete) {
    double costoPeso = paquete.peso * _tarifaPeso;
    double costoVolumen = paquete.volumen() * _tarifaVolumen;
    
    // Determine the tariff multiplier based on the destination
    double tarifaDestino = _tarifasDestino.containsKey(paquete.destino.toLowerCase())
        ? _tarifasDestino[paquete.destino.toLowerCase()]!
        : 1.0; // Default to 1.0 if the destination is not found

    // Debugging prints
    print('Costo por Peso: $costoPeso');
    print('Costo por Volumen: $costoVolumen');
    print('Tarifa Destino: $tarifaDestino');

    return (_tarifaBase + costoPeso + costoVolumen) * tarifaDestino;
  }
}