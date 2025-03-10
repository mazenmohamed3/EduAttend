import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query
  });

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
  });

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  });

  Future<Response> patchData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  });

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
  });
}
