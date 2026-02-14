import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:bookly_app_clean_architecture/core/use_cases/no_param_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase  extends NoParamUseCase<List<BookEntity>>{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call() async{
return await homeRepo.fetcNewestBooks();
    
  }
 
}