import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'package:movies/movies.dart';

import '../movies/movie_provider.dart';
import 'widgets/movie_card.dart';

/// FutureProvider to fetch movie data and use it in UI
final moviesFutureProvider = FutureProvider.autoDispose<List<Movie>>(
  (ref) async {
    ref.maintainState = true;

    final movieRepository = ref.read(movieProvider);
    final movies = await movieRepository.getPopularMovies();

    return movies;
  },
);

/// Basic home page to show the movies
class HomePage extends ConsumerWidget {
  /// Static named route for page
  static const String route = 'Home';

  /// Static method to return the widget as a PageRoute
  static Route go() => MaterialPageRoute<void>(builder: (_) => HomePage());

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(title: const Text('River Movies'), elevation: 0),
      body: watch(moviesFutureProvider).when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (movies) {
          return RefreshIndicator(
            onRefresh: () => context.refresh(moviesFutureProvider),
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (_, i) => MovieCard(movie: movies[i]),
            ),
          );
        },
      ),
    );
  }
}
