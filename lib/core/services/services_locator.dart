import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repo.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecase/getNowPlayingUseCase.dart';
import 'package:movies/movies/domain/usecase/getPopulerUseCase.dart';
import 'package:movies/movies/domain/usecase/getTopRatedUseCase.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //bloc
    // sl.registerLazySingleton(() => MoviesBloc(sl()));
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    //use cases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));

    // repository
    sl.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepository(sl()));

    //DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
