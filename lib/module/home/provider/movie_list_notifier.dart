import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';

class MovieListState {
  List<Movie> movies;
  int page;
  bool isLoading = false;

  MovieListState(
      {required this.movies, required this.page, required this.isLoading});

  MovieListState copyWith({List<Movie>? movies, int? page, bool? isLoading}) {
    return MovieListState(
        movies: movies ?? this.movies,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading);
  }
}

class MovieListNotifier extends StateNotifier<MovieListState> {
  final MovieService movieService;

  MovieListNotifier({required MovieListState state, required this.movieService})
      : super(state) {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    enableLoading();
    List<Movie> movies = await movieService.getPopularMovies(page: state.page);
    disableLoading();
    state = state
        .copyWith(movies: [...state.movies, ...movies], page: state.page++);
  }

  Future<void> getUpcomingMovies() async {
    enableLoading();
    List<Movie> movies = await movieService.getUpcomingMovies(page: state.page);
    disableLoading();
    state = state
        .copyWith(movies: [...state.movies, ...movies], page: state.page++);
  }

  void resetMovieList() {
    state = state.copyWith(movies: [], page: 1);
  }

  void enableLoading() {
    state = state.copyWith(isLoading: true);
  }

  void disableLoading() {
    state = state.copyWith(isLoading: false);
  }
}
