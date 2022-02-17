import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_tile.dart';

class MovieLists extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('movie');
    final double _widthDevice = MediaQuery.of(context).size.width;
    final double _heightDevice = MediaQuery.of(context).size.height;

    final _data = ref.watch(mainPageControllerProvider);
    final List<Movie> movies = _data.movies;
    if (movies.isNotEmpty) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: _heightDevice * 0.01, horizontal: 0),
            child: GestureDetector(
              onTap: () {},
              child: MovieTile(
                height: _heightDevice * 0.20,
                width: _widthDevice * 0.88,
                movie: movies[index],
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
