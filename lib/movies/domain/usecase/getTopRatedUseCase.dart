import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/baseUsecase.dart';
import 'package:movies/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedUseCase extends BaseUseCase <List<Movie>>{
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
