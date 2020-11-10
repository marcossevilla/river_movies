import 'dart:convert';

import 'package:equatable/equatable.dart';

/// movie model from `MovieAPI`
class Movie extends Equatable {
  /// class constructor
  Movie({
    this.title,
    this.posterPath,
  });

  /// factory constructor for `JSON` encoded response
  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  /// factory constructor for `Map` type
  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Movie(
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  /// movie's title
  final String title;

  /// movie's urlPath for poster image
  final String posterPath;

  /// getter for whole poster URL
  String get fullPosterURL => 'https://image.tmdb.org/t/p/w500/$posterPath';

  @override
  List<Object> get props => [title, posterPath];

  /// `copyWith` method returns an object with
  /// new parameters specified in the arguments
  Movie copyWith({
    String title,
    String posterPath,
  }) {
    return Movie(
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  /// `Map` type generic conversion
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'posterPath': posterPath,
    };
  }

  /// `JSON` encoding for API
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}
