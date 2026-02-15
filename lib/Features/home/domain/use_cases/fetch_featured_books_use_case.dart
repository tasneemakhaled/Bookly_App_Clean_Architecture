import 'package:bookly_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/use_cases/no_param_use_case.dart';

import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  
  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber=0]) async {
     return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
  
  
  


}

// use case تحقق priciple of singe responsibility