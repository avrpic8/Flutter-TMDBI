import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/module/home/main_page.dart';
import 'package:flutter_tmdbi/module/splash/splash_page.dart';

void main() {
  runApp(
    SplashPage(
      onInitCompleted: () => runApp(const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "Flickd",
        initialRoute: "home",
        routes: {
          'home': (BuildContext context) => MainPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
