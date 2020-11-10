import 'package:dio/dio.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:movies/movies.dart';

import '../core/globals/env.dart';

/// Movie provider for MovieRepository
final movieProvider = Provider<MovieRepository>((ref) {
  return MovieRepository(Environment.movieApiKey, Dio());
});
