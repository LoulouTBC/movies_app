// import 'dart:html';

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id; // information I want comes from jsonView of api
  final String title;
  final String releaseDate;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const Movie(
      {required this.releaseDate,
      required this.id,
      required this.title,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage
      ]; //this list have the parameters above

  //extends equatable is an alternative way

  // @override
  // bool operator ==(Object other) => //check the data to avoide duplicated data
  //     identical(this, other) ||
  //     other is Movie &&
  //         runtimeType == other.runtimeType &&
  //         id == other.id &&
  //         title == other.title &&
  //         backdropPath == other.backdropPath &&
  //         genreIds == other.genreIds &&
  //         voteAverage == other.voteAverage &&
  //         overview == other.overview;

  // @override
  // int get hashCode =>
  //     id.hashCode ^ //XOR//binary to both numbers then xor
  //     title.hashCode ^
  //     backdropPath.hashCode ^
  //     genreIds.hashCode ^
  //     overview.hashCode ^
  //     voteAverage.hashCode;
}
