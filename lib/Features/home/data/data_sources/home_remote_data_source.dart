import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';


abstract class HomeRemoteDataSource {  // from api   بحدد فيه اي اللي بيتعمله فيتش مش ازاي ولا يفرق معايا جه فشل ولا لا لاني مش هكتب بادي
 Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>> fetcNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetcNewestBooks() {
    // TODO: implement fetcNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

}