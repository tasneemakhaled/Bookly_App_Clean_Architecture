import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/use_cases/no_param_use_case.dart';

import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends NoParamUseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  
  @override
  Future<Either<Failure, List<BookEntity>>> call()async {
  return await homeRepo.fetchFeaturedBooks();
    
  }
  


}

// use case تحقق priciple of singe responsibility