import 'package:flutter/material.dart';

import 'home/home_page.dart';

/// MaterialApp widget with app config
class RiverMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      home: HomePage(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
