import 'package:bookly_app_clean_architecture/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:bookly_app_clean_architecture/core/utils/functions/save_books.dart';
import 'package:hive_ce/hive.dart';


abstract class HomeRemoteDataSource {  // from api   بحدد فيه اي اللي بيتعمله فيتش مش ازاي ولا يفرق معايا جه فشل ولا لا لاني مش هكتب بادي
 Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>> fetcNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this .apiService});
  @override
  Future<List<BookEntity>> fetcNewestBooks() async{
  var data =await  apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q="programming"');
  List<BookEntity> books = getBooksList(data);
  saveBooksData(books,kNewestbox);
  return books;
  }

  

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
     List<BookEntity>books=[];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
  var data =await  apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q="programming"');
 List<BookEntity> books = getBooksList(data);
 saveBooksData(books,kFeaturedbox);
  return books;

  }}