import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';
import 'package:movies/test.dart';
// import 'dart:html';

void main() {
  // Movie movie = const Movie(
  //     id: 1,
  //     title: 'title',
  //     backdropPath: 'backdropPath',
  //     // genreIds: [0],//problems of const is here because it is a list
  //     genreIds: [0],
  //     overview: 'overview',
  //     voteAverage: 1.0);
  // Movie movie1 = const Movie(
  //     id: 1,
  //     title: 'title',
  //     backdropPath: 'backdropPath',
  //     genreIds:  [0],
  //     overview: 'overview',
  //     voteAverage: 1.0);
  // print(movie == movie1); //check duplicate
  // print(movie1.hashCode);
  // print(movie.hashCode);
  // int x = 20;
  // int y = 40;
  // print(x ^ y);

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Test(),
    );
  }
}
