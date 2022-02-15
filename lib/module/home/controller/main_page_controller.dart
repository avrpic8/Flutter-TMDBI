import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/main_page_data.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';

class MainPageController extends StateNotifier<MainPageData> {
  final ProviderReference ref;
  final MovieService movieService;

  final TextEditingController searchBarController = TextEditingController();

  MainPageController({required this.ref, required this.movieService})
      : super(MainPageData.init()) {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      List<Movie> movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          movies = await movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          movies = await movieService.getUpcomingMovies(page: state.page);
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
      getMovies();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    searchBarController.dispose();
  }
}
