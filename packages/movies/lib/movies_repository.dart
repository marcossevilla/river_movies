import 'package:dio/dio.dart';

import 'globals.dart';
import 'models/movie.dart';

/// repository with methods to get movies from api
class MovieRepository {
  /// repository constructor expecting apiKey
  MovieRepository(this._apiKey, this._dio);

  final Dio _dio;
  final String _apiKey;

  /// public method to get all popular movies
  Future<List<Movie>> getPopularMovies() async {
    final response = await _dio.get(
      '${Globals.popularMovies}?api_key=$_apiKey&language=en-US&page=1',
    );

    final results = List<Map<String, dynamic>>.from(response.data['results']);

    final movies = results.map((e) => Movie.fromMap(e)).toList(growable: false);

    return movies;
  }
}
