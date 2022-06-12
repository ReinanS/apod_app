import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  const ApodEntity({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [
        copyright,
        date,
        explanation,
        hdurl,
        mediaType,
        serviceVersion,
        title,
        url,
      ];

  Map<String, dynamic> toMap() {
    return {
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

  factory ApodEntity.fromMap(Map<String, dynamic> map) {
    return ApodEntity(
      copyright: map['copyright'] ?? '',
      date: map['date'] ?? '',
      explanation: map['explanation'] ?? '',
      hdurl: map['hdurl'] ?? '',
      mediaType: map['media_type'] ?? '',
      serviceVersion: map['service_version'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApodEntity.fromJson(String source) =>
      ApodEntity.fromMap(json.decode(source));
}
