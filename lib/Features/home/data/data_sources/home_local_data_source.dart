import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource { // from local data base cashing  data from api
 List<BookEntity> fetchFeaturedBooks();
 List<BookEntity> fetcNewestBooks();
}
class HomeLocalDataSourceimpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetcNewestBooks() {
    var box=Hive.box<BookEntity>(kNewestbox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
   var box=Hive.box<BookEntity>(kFeaturedbox);
    return box.values.toList();
  }

}