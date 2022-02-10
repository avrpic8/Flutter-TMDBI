import 'package:flutter/material.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:get_it/get_it.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;

  final GetIt getIt = GetIt.instance;

  MovieTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie.posterUrl()),
          const SizedBox(
            width: 6,
          ),
          Expanded(child: _movieInfoWidget()),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String url) {
    return Image.network(url);
  }

  Widget _movieInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                movie.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white54,
                ),
              ),
            ),
            Text(
              movie.rating.toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white54,
              ),
            )
          ],
        ),
        Text(
          '${movie.language} | R: ${movie.isAdult.toString()} | ${movie.releaseDate}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 16,),
        Expanded(
          child: Text(
            movie.description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
          ),
        )
      ],
    );
  }
}
