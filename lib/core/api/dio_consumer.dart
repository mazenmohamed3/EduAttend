import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../errors/exception.dart';
import '/core/api/api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio, required String baseUrl}) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true,
        ),
      );
    }
  }

  @override
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: query);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
  }) async {
    try {
      final response = await dio.post(url, queryParameters: query, data: data);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.put(url, queryParameters: query, data: data);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> patchData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.patch(url, data: data, queryParameters: query);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.delete(url, data: data);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  dynamic _handelDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        if (error.response!.statusCode! >= 500) {
          throw ServerException("errorMessage".tr());
        }

        final message =
            error.response!.data['message'] ??
            error
                .response!
                .data['errors'][error.response!.data['errors'].keys.first]
                .join()
                .toString() ??
            'errorMessage'.tr();
        throw NotFoundException(message);
      case DioExceptionType.cancel:
        throw const ServerException('Cancel');
      case DioExceptionType.unknown:
        final message =
            error.response!.data['message'] ??
            error
                .response!
                .data['errors'][error.response!.data['errors'].keys.first]
                .join()
                .toString() ??
            'errorMessage'.tr();
        throw NotFoundException(message);

      default:
        final message =
            error.response!.data['message'] ??
            error
                .response!
                .data['errors'][error.response!.data['errors'].keys.first]
                .join()
                .toString() ??
            'errorMessage'.tr();
        return throw NotFoundException(message);
    }
  }
}
