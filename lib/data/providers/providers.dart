import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/core/util/constants.dart';
import 'package:flutter_tmdbi/data/models/app_config.dart';
import 'package:flutter_tmdbi/data/services/http_service.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';
import 'package:flutter_tmdbi/module/home/provider/category_notifier.dart';
import 'package:flutter_tmdbi/module/home/provider/movie_list_notifier.dart';

final appConfigProvider = Provider<AppConfig>(
  (_) => AppConfig(baseUrl: baseUrl, imgUrl: baseImageApiUrl, apiKey: apiKey),
);

final httpServiceProvider =
    Provider<HttpService>((ref) => HttpService(ref: ref));

final movieServiceProvider =
    Provider<MovieService>((ref) => MovieService(ref: ref));

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier();
});

final movieListProvider =
    StateNotifierProvider<MovieListNotifier, MovieListState>(
  (ref) {
    final movieService = ref.watch(movieServiceProvider);
    return MovieListNotifier(
        state: MovieListState(movies: [], page: 1, isLoading: false),
        movieService: movieService);
  },
);

final selectedMoviePosterProvider = StateProvider<String?>((ref) {
  final movies = ref.watch(movieListProvider).movies;
  return movies.isNotEmpty ? movies[0].posterUrl() : null;
});
