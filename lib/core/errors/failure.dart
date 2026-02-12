import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException){
    switch(dioException.type){
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time out with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout');
      case DioExceptionType.receiveTimeout:
      return ServerFailure('receive Timeout with api server');
      case DioExceptionType.badCertificate:
         return ServerFailure('badCertificate with api server');
      case DioExceptionType.badResponse:
         return ServerFailure('badResponse with api server');
      case DioExceptionType.cancel:
         return ServerFailure('Request to api server was cancelled');
      case DioExceptionType.connectionError:
         return ServerFailure('connectionError');
      case DioExceptionType.unknown:
        return ServerFailure.fromResponse(dioException.response!.statusCode, dioException.response!.data);
    }
  }
  factory ServerFailure.fromResponse(int? statusCode,dynamic response){
  if (statusCode==400||statusCode==401||statusCode==403){
    return ServerFailure(response['error']['message']);
  }else if (statusCode==404){
    return ServerFailure('Your request not found please try again later!');
  }else if (statusCode==500){
  return ServerFailure('Internal server error please try aagin later!');
  }else{
    return ServerFailure('ooops there was an error please try later');
  }
  }
}