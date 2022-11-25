import 'package:dartz/dartz.dart';
import 'package:movies/core/network/error_message.dart';
import 'package:movies/error/exception.dart';
import 'package:movies/error/failure.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepo {
  //I will work with data source so I have to call data source and I can't do implementation to implementation
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  //make constructor
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    //either <fail,success>
    final result = await  baseMovieRemoteDataSource.getNowPlayingMovies();
    //I am waiting error or list of movies
    //I need some thing return two types of data
    //it is a package in flutter name dartz
    try {
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopulerMovies() async{
    final result = await  baseMovieRemoteDataSource.getPopularMovies();
    //I am waiting error or list of movies
    //I need some thing return two types of data
    //it is a package in flutter name dartz
    try {
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await  baseMovieRemoteDataSource.getTopRatedMovies();
    //I am waiting error or list of movies
    //I need some thing return two types of data
    //it is a package in flutter name dartz
    try {
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
