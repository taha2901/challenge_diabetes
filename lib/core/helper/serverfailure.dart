import 'package:dio/dio.dart';
//server failure
abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final statusMessage = error.response?.statusMessage;
        return ServerFailure(
            "Received invalid status code: $statusCode with message: $statusMessage");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout in connection with API server");
      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error occurred: ${error.message}");

      default:
        return ServerFailure("An unknown error occurred");
    }
  }
}
