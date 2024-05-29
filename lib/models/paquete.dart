class Paquete {
  int? id;
  double peso;
  double largo;
  double ancho;
  double alto;
  String destino;

  Paquete({
    this.id,
    required this.peso,
    required this.largo,
    required this.ancho,
    required this.alto,
    required this.destino,
  });

  factory Paquete.fromJson(Map<String, dynamic> json) {
    return Paquete(
      id: json['id'],
      peso: json['peso'],
      largo: json['largo'],
      ancho: json['ancho'],
      alto: json['alto'],
      destino: json['destino'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'peso': peso,
      'largo': largo,
      'ancho': ancho,
      'alto': alto,
      'destino': destino,
    };
  }

  double volumen() {
    return largo * ancho * alto / 1000000; // Volumen en metros cúbicos si las dimensiones están en cm
  }
}
