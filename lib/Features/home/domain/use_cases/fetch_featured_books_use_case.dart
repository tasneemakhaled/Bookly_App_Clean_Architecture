import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
   Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
   }
}

// use case تحقق priciple of singe responsibility