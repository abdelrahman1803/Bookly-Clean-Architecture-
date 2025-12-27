import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout, Please try again!");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Sending timeout, Please try again!");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receiving timeout, Please try again!");

      case DioExceptionType.badCertificate:
        return ServerFailure(
          "Connection Failed\nWe couldn't verify the server's security certificate. Please check your internet connection or try again later.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          "The request was cancelled before it was completed.",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          "Failed to connect to the server. Please check your internet connection.",
        );

      case DioExceptionType.unknown:
        if (e.message?.contains('SocketException') ?? false) {
          return ServerFailure(
            "Failed to connect to the server. Please check your internet connection.",
          );
        }
        return ServerFailure(
          "An unexpected error occurred. Please try again later.",
        );
    }
  }
  factory ServerFailure.fromResponse(
    int? statusCode,
    Map<String, dynamic> json,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(json['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('An error occurred, Please try again!');
    }
  }
}
