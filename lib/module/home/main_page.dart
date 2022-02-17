import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/module/home/controller/main_page_controller.dart';
import 'package:flutter_tmdbi/data/models/main_page_data.dart';
import 'package:flutter_tmdbi/data/models/movie.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_lists.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_tile.dart';
import 'package:flutter_tmdbi/module/home/widget/top_bar.dart';

class MainPage extends StatelessWidget {
  late double _heightDevice;
  late double _widthDevice;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _widthDevice = MediaQuery.of(context).size.width;
    _heightDevice = MediaQuery.of(context).size.height;
    print('hi');
    return _buildUi();
  }

  Widget _buildUi() {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          const TopBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: _heightDevice * 0.01),
              child: MovieLists(),
            ),
          )
        ],
      ),
    );
  }
}
