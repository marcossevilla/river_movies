import 'package:flutter/material.dart';

import 'package:movies/movies.dart';

/// Widget to show movie info
class MovieCard extends StatelessWidget {
  /// Widget constructor
  const MovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  /// Individual movie for the card
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(movie.fullPosterURL),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
