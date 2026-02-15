import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';


abstract class HomeLocalDataSource { // from local data base cashing  data from api
 List<BookEntity> fetchFeaturedBooks({int pageNumber=0});
 List<BookEntity> fetcNewestBooks();
}
class HomeLocalDataSourceimpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetcNewestBooks() {
    var box=Hive.box<BookEntity>(kNewestbox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
   var box=Hive.box<BookEntity>(kFeaturedbox);
int length=box.values.length;
if(startIndex>=length|| endIndex>length) {
return [];
}
  return box.values.toList().sublist(startIndex,endIndex);
  }

}