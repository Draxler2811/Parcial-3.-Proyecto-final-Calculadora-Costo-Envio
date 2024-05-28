import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:calculado_a_costo_envio/models/paquete.dart';

class EnvioService {
  final String _baseUrl = 'http://localhost:8888';

  Future<double> obtenerCostoEnvio(Paquete paquete) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/envio'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(paquete.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['costo'];
    } else {
      throw Exception('Fallo al obtener el costo de envío');
    }
  }
}
