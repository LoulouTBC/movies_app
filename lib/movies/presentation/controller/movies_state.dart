//states is movies / loading/ message when error
import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enuns.dart';
import 'package:movies/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;

  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;
  final String nowPlayingmessage;
  final String popularMessage;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingmessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  //to do it with same object
  MoviesState copyWith({List<Movie>? nowPlayingMovies,
   List<Movie>? popularMovies,
   List<Movie>? topRatedMovies,

   RequestState? nowPlayingState,
   RequestState? popularState,
   RequestState? topRatedState,
   String? nowPlayingmessage,
   String? popularMessage,
   String? topRatedMessage}){
    return MoviesState(
       nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
       nowPlayingState: nowPlayingState?? this.nowPlayingState,
       nowPlayingmessage: nowPlayingmessage?? this.nowPlayingmessage,
        popularMovies: popularMovies?? this.popularMovies,
       popularState: popularState?? this.popularState,
       popularMessage: popularMessage?? this.popularMessage,
       topRatedMovies: topRatedMovies?? this.topRatedMovies,
       topRatedState: topRatedState?? this.topRatedState,
       topRatedMessage: topRatedMessage?? this.topRatedMessage,
    );

  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingmessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];
}
