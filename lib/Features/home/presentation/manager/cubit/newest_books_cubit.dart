import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
 NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void>fetchNewestBooks()async{
    emit(NewestBooksLoading());
   var books= await fetchNewestBooksUseCase.call();
   books.fold((failure){
    emit(NewestBooksFailure(errMessage: failure.errorMessage));
   }, (books){
    emit(NewestBooksSuccess(books: books));
   });

  }
}
