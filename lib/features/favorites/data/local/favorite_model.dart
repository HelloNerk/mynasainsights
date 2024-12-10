class FavoriteModel {
  final int? id; // ID generado automáticamente por la base de datos (puede ser null)
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  FavoriteModel({
    this.id,
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,


  });

  // Crear una instancia desde un mapa (consulta de la base de datos)
  factory FavoriteModel.fromMap(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'], // Será null al insertar, pero no al recuperar
      copyright: json['copyright']??'',
      date: json['date']??'',
      explanation: json['explanation']??'',
      hdurl: json['hdurl']??'',
      mediaType: json['media_type']??'',
      serviceVersion: json['service_version']??'',
      title: json['title']??'',
      url: json['url']??'',
    );
  }

  // Convertir a un mapa para insertar en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id, // El id puede omitirse al insertar
      'copyright': copyright,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'media_type': mediaType,
      'service_version': serviceVersion,
      'title': title,
      'url': url,
    };
  }
}
