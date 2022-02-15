import 'package:flutter/material.dart';
import 'package:flutter_tmdbi/core/util/constants.dart';
import 'package:flutter_tmdbi/data/models/app_config.dart';
import 'package:flutter_tmdbi/data/services/http_service.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitCompleted;

  const SplashPage({Key? key, required this.onInitCompleted}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) => _setup(context).then((_) => widget.onInitCompleted()),
    );
    super.initState();
  }

  Future<void> _setup(BuildContext context) async {
    // final getIt = GetIt.instance;
    // getIt.registerSingleton<AppConfig>(
    //     AppConfig(baseUrl: baseUrl, imgUrl: baseImageApiUrl, apiKey: apiKey));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
