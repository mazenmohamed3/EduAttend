import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
abstract class Failure {
  String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioError, {bool? login}) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "errorMessage".tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "errorMessage".tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "errorMessage".tr());

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!);
      case DioExceptionType.cancel:
        return ServerFailure(message: "errorMessage".tr());

      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure(message: "No Internet Connection");
        } else {
          return ServerFailure(message: "errorMessage".tr());
        }

      default:
        return ServerFailure(message: "errorMessage".tr());
    }
  }

  factory ServerFailure.fromResponse(
      int statusCode,
      dynamic response,
      ) {
    if (statusCode == 400 || statusCode == 403) {
      if (response.data['message'] != null) {
        return ServerFailure(
            message: response.data['message'] ?? "errorMessage".tr());
      }
      String message = '';
      response.data['errors'].forEach((key, value) {
        message += "$value ";
      });
      message =
      "${message.replaceAll("{", "").replaceAll("}", "").replaceAll('[', '').replaceAll(']', '').replaceAll('data', '').replaceAll(':', '')}\n";

      return ServerFailure(
          message: message == '' ? "errorMessage".tr() : message);
    } else if (statusCode == 404 || statusCode == 429) {
      // 404 not found
      return ServerFailure(
          message: response.data['message'] ?? "errorMessage".tr());
    } else if (statusCode == 409) {
      // 409 conflict
      String message =
      jsonEncode(response.data['message'] ?? "errorMessage".tr());
      return ServerFailure(message: message);
    } else if (statusCode == 500) {
      // 500 internal server error
      return ServerFailure(message: "errorMessage".tr());
    } else if (statusCode == 422) {
      String message = '';
      response.data['errors'].forEach((key, value) {
        message += "$value ";
      });
      message =
      "${message.replaceAll("{", "").replaceAll("}", "").replaceAll('[', '').replaceAll(']', '').replaceAll('data', '').replaceAll(':', '')}\n";
      return ServerFailure(
          message: message.isEmpty ? "errorMessage".tr() : message);
    } else {
      return ServerFailure(message: "errorMessage".tr());
    }
  }
}

class FailureLocal extends Failure {
  FailureLocal({required super.message});
}
