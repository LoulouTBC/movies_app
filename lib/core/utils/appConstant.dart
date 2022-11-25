class AppConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '338baa2bca9a0685cc5fbd92b0a5ceba';
  static const String nowPlayingPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String populerPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl (String path) => '$baseImageUrl$path';
}
