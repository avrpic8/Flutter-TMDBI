import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_tile.dart';

class MovieLists extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _widthDevice = MediaQuery.of(context).size.width;
    final double _heightDevice = MediaQuery.of(context).size.height;

    final movieData = ref.watch(movieListProvider);
    final List<Movie> movies = movieData.movies;
    return NotificationListener(
      onNotification: (onScroll) {
        if (onScroll is ScrollEndNotification) {
          final before = onScroll.metrics.extentBefore;
          final max = onScroll.metrics.maxScrollExtent;
          if (before == max) {
            ref.read(movieListProvider.notifier).getPopularMovies();
            return true;
          }
          return false;
        }
        return false;
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: _heightDevice * 0.01, horizontal: 0),
            child: GestureDetector(
              onTap: () {
                print('click');
                ref.read(selectedMoviePosterProvider.notifier).state =
                    movies[index].posterUrl();
              },
              child: MovieTile(
                height: _heightDevice * 0.20,
                width: _widthDevice * 0.88,
                movie: movies[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
