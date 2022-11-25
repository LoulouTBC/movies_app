import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent(); //we have three events /nowplaying/populer...

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopulerEvent extends MoviesEvent {}

class GetTopRatedEvent extends MoviesEvent {}
