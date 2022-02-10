import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_tile.dart';

class MainPage extends ConsumerWidget {
  late double _heightDevice;
  late double _widthDevice;

  late TextEditingController _searchBarController;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _widthDevice = MediaQuery.of(context).size.width;
    _heightDevice = MediaQuery.of(context).size.height;

    _searchBarController = TextEditingController();
    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: _widthDevice,
        height: _heightDevice,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backGroundWidget(),
            _foreGroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backGroundWidget() {
    return Container(
      width: _widthDevice,
      height: _heightDevice,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://m.media-amazon.com/images/M/MV5BZmYzMzU4NjctNDI0Mi00MGExLWI3ZDQtYzQzYThmYzc2ZmNjXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg'))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget _foreGroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _heightDevice * 0.02, 0, 0),
      width: _widthDevice * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidgt(),
          Container(
            height: _heightDevice * 0.85,
            padding: EdgeInsets.symmetric(vertical: _heightDevice * 0.01),
            child: _moviesListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topBarWidgt() {
    return Container(
      height: _heightDevice * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      width: _widthDevice * 0.50,
      height: _heightDevice * 0.05,
      child: TextField(
        controller: _searchBarController,
        onSubmitted: (_intput) {},
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: const TextStyle(color: Colors.white54),
            filled: false,
            fillColor: Colors.white24,
            hintText: 'Search ...'),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (value) {},
      items: const [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        )
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> movies = [];
    for (var i = 0; i < 20; i++) {
      movies.add(Movie(
          name: 'Mortal kombat',
          language: 'En',
          isAdult: true,
          description:
              'test descriptio for a dummy tutorial for flutter this tutorial is for get information from th tmdbi',
          posterPath: '/oifhfVhUcuDjE61V5bS5dfShQrm.jpg',
          backdropPath: '/1Wlwnhn5sXUIwlxpJgWszT622PS.jpg',
          rating: 3,
          releaseDate: '2017'));
    }
    if (movies.isNotEmpty) {
      return ListView.builder(
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
