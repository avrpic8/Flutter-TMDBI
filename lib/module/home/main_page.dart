import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';
import 'package:flutter_tmdbi/module/home/widget/movie_lists.dart';

import 'package:flutter_tmdbi/module/home/widget/top_bar.dart';

class MainPage extends StatelessWidget {
  late double _heightDevice;
  late double _widthDevice;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _widthDevice = MediaQuery.of(context).size.width;
    _heightDevice = MediaQuery.of(context).size.height;
    print('main');
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
              _loading(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backGroundWidget() {
    return Consumer(
      builder: (context, ref, child) {
        print('background');
        final posterMovie = ref.watch(selectedMoviePosterProvider);
        if (posterMovie != null) {
          return Container(
            width: _widthDevice,
            height: _heightDevice,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(posterMovie),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
            ),
          );
        } else {
          return Container(
            width: _widthDevice,
            height: _heightDevice,
            color: Colors.black,
          );
        }
      },
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
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: Consumer(
        builder: (context, ref, child) {
          final loading = ref.watch(movieListProvider).isLoading;
          if (loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
