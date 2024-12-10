import '../../domain/apod.dart';

class ApodDto {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  ApodDto({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory ApodDto.fromJson(Map<String, dynamic> json) {
    return ApodDto(
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

  Apod toApod() {
    return Apod(
      copyright: copyright,
      date: date,
      explanation:explanation,
      hdurl: hdurl,
      mediaType: mediaType,
      serviceVersion: serviceVersion,
      title: title,
      url: url,
    );
  }
}