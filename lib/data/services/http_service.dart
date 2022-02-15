import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';

class HttpService {
  final ProviderReference ref;
  final Dio dio = Dio();

  late String _baseUrl;
  late String _apiKey;

  HttpService({required this.ref}) {
    final config = ref.watch(appConfigProvider);
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
