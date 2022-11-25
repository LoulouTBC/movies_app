import 'package:dio/dio.dart';
import 'package:movies/core/network/error_message.dart';
import 'package:movies/core/utils/appConstant.dart';
import 'package:movies/error/exception.dart';
import 'package:movies/movies/data/models/movies_module.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  //determine from usecases
  //and we need dio
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    //if I put movie so I don't have access to my fromjson so I return list of MovieModel
    final response = await Dio().get(AppConstance.nowPlayingPath);
    
    if (response.statusCode == 200) {
      //I need to access 'result' from api result hhh *_* which is list of objects
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      // return null or [];wrong way so we have to handle exception
      // return ErrorMessage.fromJson(response.data);
      // throw Exception();
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    //if I put movie so I don't have access to my fromjson so I return list of MovieModel
    final response = await Dio().get(AppConstance.populerPath);
    if (response.statusCode == 200) {
      //I need to access 'result' from api result hhh *_* which is list of objects
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      // return null or [];wrong way so we have to handle exception
      // return ErrorMessage.fromJson(response.data);
      // throw Exception();
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    //if I put movie so I don't have access to my fromjson so I return list of MovieModel
    final response = await Dio().get(AppConstance.topRatedPath);
    if (response.statusCode == 200) {
      //I need to access 'result' from api result hhh *_* which is list of objects
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      // return null or [];wrong way so we have to handle exception
      // return ErrorMessage.fromJson(response.data);
      // throw Exception();
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
