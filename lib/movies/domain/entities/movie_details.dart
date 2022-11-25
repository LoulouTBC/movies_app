import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  // final List<generes>;//need a new entity
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final String votAverage;

  const MovieDetails(
      {required this.backDropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.votAverage});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backDropPath, id, overview, releaseDate, runTime, title, votAverage];
}
