import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enuns.dart';
import 'package:movies/movies/domain/usecase/getNowPlayingUseCase.dart';
import 'package:movies/movies/domain/usecase/getPopulerUseCase.dart';
import 'package:movies/movies/domain/usecase/getTopRatedUseCase.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';

//bloc takes event and states
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MoviesBloc(this.getNowPlayingUseCase, this.getPopularUseCase,
      this.getTopRatedUseCase)
      : super(MoviesState()) {
    //we need when create bloc to call event at the same moment
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopulerEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    //emit tell the ui that I have the data back
    //so when I say emit then i tell him to set a state that I will give you

    // BaseMovieRemoteDataSource baseMovieRemoteDataSource =
    //     MovieRemoteDataSource();
    // print(baseMovieRemoteDataSource.hashCode);
    // BaseMoviesRepo baseMoviesRepo =
    //     MoviesRepository(baseMovieRemoteDataSource);
    // print('===========================');
    // print(baseMovieRemoteDataSource.hashCode);
    final result = await getNowPlayingUseCase();
    // print(result);
    result.fold(
        (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingmessage: l.message)
            // MoviesState(
            //   nowPlayingState: RequestState.error, nowPlayingmessage: l.message)
            ),
        (r) => emit(state.copyWith(
                nowPlayingState: RequestState.loaded, nowPlayingMovies: r)
            // MoviesState(
            //   nowPlayingState: RequestState.loaded, nowPlayingMovies: r)
            ));
  }

  FutureOr<void> _getPopularMovies(
      GetPopulerEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCase();//بتنادي call لحالا
    result.fold(
        (l) => emit(state.copyWith(
                popularState: RequestState.error, popularMessage: l.message)
            // MoviesState(
            //   popularState: RequestState.error, popularMessage: l.message)
            ),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)));
  }
}
