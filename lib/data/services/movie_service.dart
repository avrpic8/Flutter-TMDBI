import 'package:flutter_tmdbi/data/services/http_service.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HttpService http;

  MovieService() {
    http = getIt.get<HttpService>();
  }
}
