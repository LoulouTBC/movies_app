import 'package:movies/movies/domain/entities/movie.dart';

//where we convert json
class MovieModel extends Movie {
  const MovieModel(
      {required String releaseDate, //or required super.id directly
      required int id,
      required String title,
      required String backdropPath,
      required List<int> genreIds,
      required String overview,
      required double voteAverage})
      : super(
            releaseDate: releaseDate,
            id: id,
            title: title,
            backdropPath: backdropPath,
            genreIds: genreIds,
            overview: overview,
            voteAverage: voteAverage);

  factory MovieModel.fromJson(
          Map<String, dynamic>
              json) //هل القيم الكي يعني اسماء الحقول هيي سترينغ؟ اي وهل هيي ثابتة القيم تبعها ؟ لا
      =>
      MovieModel(
          releaseDate: json["release_date"],
          id: json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
          overview: json["overview"],
          voteAverage: json["vote_average"].toDouble(),);
}
