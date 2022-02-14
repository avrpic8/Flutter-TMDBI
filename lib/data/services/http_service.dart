import 'package:dio/dio.dart';
import 'package:flutter_tmdbi/data/models/app_config.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _baseUrl;
  late String _apiKey;

  HttpService() {
    AppConfig config = getIt.get<AppConfig>();
    _baseUrl = config.baseUrl;
    _apiKey = config.apiKey;
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      String url = '$_baseUrl$path';
      Map<String, dynamic> _query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(url, queryParameters: _query);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }
}
