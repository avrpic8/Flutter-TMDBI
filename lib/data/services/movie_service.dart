import 'package:dio/dio.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/services/http_service.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HttpService _http;

  MovieService() {
    _http = getIt.get<HttpService>();
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response response = await _http.get('/movie/popular', query: {
      'page': page,
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies = data['results'].map<Movie>((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Could not load movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies({required int page}) async {
    Response response = await _http.get('/movie/upcoming', query: {
      'page': page,
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies = data['results'].map<Movie>((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Could not load movies');
    }
  }
}
