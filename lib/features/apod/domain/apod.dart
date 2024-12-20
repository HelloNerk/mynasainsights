class Apod{
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  Apod({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  Map<String,dynamic>toMap(){
    return {
      'copyright':copyright,
      'date':date,
      'explanation':explanation,
      'hdurl':hdurl,
      'mediaType':mediaType,
      'serviceVersion':serviceVersion,
      'title':title,
      'url':url,
    };
  }

  factory Apod.fromMap(Map<String,dynamic>map){
    return Apod(
      copyright: map['copyright'],
      date: map['date'],
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['mediaType'],
      serviceVersion: map['serviceVersion'],
      title: map['title'],
      url: map['url'],
    );
  }
}