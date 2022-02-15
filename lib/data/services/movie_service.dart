import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';
import 'package:flutter_tmdbi/data/services/http_service.dart';

class MovieService {
  final ProviderReference ref;
  late HttpService _http;

  MovieService({required this.ref}) {
    _http = ref.watch(httpServiceProvider);
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response response = await _http.get('/movie/popular', query: {
      'page': page,
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movie) => Movie.fromJson(movie)).toList();
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
      List<Movie> movies =
          data['results'].map<Movie>((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Could not load movies');
    }
  }
}
