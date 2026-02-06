import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

// ignore: avoid_types_as_parameter_names
abstract class NoParamUseCase<T> {  //generic data type
  Future<Either<Failure,T>> call();
}
