import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void>fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
   var books= await fetchFeaturedBooksUseCase.call();
   books.fold((failure){
    emit(FeaturedBooksFailure(errMessage: failure.errorMessage));
   }, (books){
    emit(FeaturedBooksSuccess(books: books));
   });

  }
}
