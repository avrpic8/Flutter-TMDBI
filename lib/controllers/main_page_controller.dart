import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/main_page_data.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';
import 'package:get_it/get_it.dart';

class MainPageController extends StateNotifier<MainPageData> {
  final MovieService _movieService = GetIt.instance.get<MovieService>();

  MainPageController() : super(MainPageData.init()) {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      List<Movie> movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          movies = await _movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          movies = await _movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          movies = [];
        }
      }
      state = state
          .copyWith(movies: [...state.movies, ...movies], page: state.page + 1);
    } catch (e) {
      print(e.toString());
    }
  }

  void updateSearchCategory(String category) {
    try {
      state = state.copyWith(
          movies: [], page: 1, searchCategory: category, searchText: '');
    } catch (e) {
      print(e.toString());
    }
  }
}
