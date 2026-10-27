import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer');
      case DioExceptionType.unknown:
        return ServerFailure(e.message ?? 'Unknown server error');
      case DioExceptionType.transformTimeout:
        return ServerFailure('Response transformation timed out');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your requested resource not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('Unknown server error, please try again later');

    }
  }
}
