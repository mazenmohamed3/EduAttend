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
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([super.message]);
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message]) : super("errorMessage".tr());
}

//TODO: implement localization
class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
    : super('No Internet Connection'.tr());
}

class CacheException implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  String toString() {
    return '$message';
  }
}