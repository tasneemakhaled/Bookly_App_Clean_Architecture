import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource { // from local data base cashing  data from api
 List<BookEntity> fetchFeaturedBooks();
 List<BookEntity> fetcNewestBooks();
}
class HomeLocalDataSourceimpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetcNewestBooks() {
    // TODO: implement fetcNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

}