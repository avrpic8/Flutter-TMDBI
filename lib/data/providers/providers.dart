import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/main_page_data.dart';
import 'package:flutter_tmdbi/module/home/controller/main_page_controller.dart';
import 'package:flutter_tmdbi/core/util/constants.dart';
import 'package:flutter_tmdbi/data/models/app_config.dart';
import 'package:flutter_tmdbi/data/services/http_service.dart';
import 'package:flutter_tmdbi/data/services/movie_service.dart';

final appConfigProvider = Provider<AppConfig>(
  (_) => AppConfig(baseUrl: baseUrl, imgUrl: baseImageApiUrl, apiKey: apiKey),
);

final httpServiceProvider =
    Provider<HttpService>((ref) => HttpService(ref: ref));

final movieServiceProvider =
    Provider<MovieService>((ref) => MovieService(ref: ref));
    
final mainPageControllerProvider = StateNotifierProvider<MainPageController, MainPageData>(
  (ref) {
    final movieService = ref.watch(movieServiceProvider);
    return MainPageController( movieService: movieService);
  },
);
