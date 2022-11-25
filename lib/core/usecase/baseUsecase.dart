import 'package:dartz/dartz.dart';
import 'package:movies/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';

abstract class BaseUseCase <T>{
Future <Either<Failure,T>>  call();
}
