import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super(message ?? "Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message ?? "Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message ?? "Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(message ?? "Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message ?? "Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message]) : super(message ?? "errorMessage".tr());
}

//TODO: implement localization
class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
    : super(message ?? 'No Internet Connection'.tr());
}

class CacheException implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  String toString() {
    return '$message';
  }
}