import 'package:dartz/dartz.dart';
import 'package:movies/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepo { 
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();//first abstract method to get from api
  Future<Either<Failure, List<Movie>>> getPopulerMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}