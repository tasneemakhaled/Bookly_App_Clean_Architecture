import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T,Param> {  //generic data type
  Future<Either<Failure,T>> call([Param param]);
}
