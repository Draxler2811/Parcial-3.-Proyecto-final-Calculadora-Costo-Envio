import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/paquete.dart';

class PaqueteService {
  final String baseUrl = 'http://localhost:8888';

  Future<List<Paquete>> obtenerPaquetes() async {
    final response = await http.get(Uri.parse('$baseUrl/paquetes'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Paquete.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los paquetes');
    }
  }

  Future<void> agregarPaquete(Paquete paquete) async {
    final response = await http.post(
      Uri.parse('$baseUrl/paquetes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paquete.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al agregar el paquete');
    }
  }

  Future<void> actualizarPaquete(int id, Paquete paquete) async {
    final response = await http.put(
      Uri.parse('$baseUrl/paquetes/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paquete.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el paquete');
    }
  }

  Future<void> eliminarPaquete(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/paquetes/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el paquete');
    }
  }
}
