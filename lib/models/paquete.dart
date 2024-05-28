class Paquete {
  double peso;
  double largo;
  double ancho;
  double alto;
  String destino;

  Paquete({
    required this.peso,
    required this.largo,
    required this.ancho,
    required this.alto,
    required this.destino,
  });

  double volumen() {
    return (largo / 100) * (ancho / 100) * (alto / 100);
  }

  factory Paquete.fromJson(Map<String, dynamic> json) {
    return Paquete(
      peso: json['peso'],
      largo: json['largo'],
      ancho: json['ancho'],
      alto: json['alto'],
      destino: json['destino'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'peso': peso,
      'largo': largo,
      'ancho': ancho,
      'alto': alto,
      'destino': destino,
    };
  }
}
