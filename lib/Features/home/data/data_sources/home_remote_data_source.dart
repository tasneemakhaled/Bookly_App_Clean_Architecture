import 'package:bookly_app_clean_architecture/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';


abstract class HomeRemoteDataSource {  // from api   بحدد فيه اي اللي بيتعمله فيتش مش ازاي ولا يفرق معايا جه فشل ولا لا لاني مش هكتب بادي
 Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>> fetcNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this .apiService});
  @override
  Future<List<BookEntity>> fetcNewestBooks() async{
  var data =await  apiService.get(endPoint: 'volumes?q="programming&Filtering=free-ebooks');
  List<BookEntity> books = getBooksList(data);
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
 var data =await  apiService.get(endPoint: 'volumes?q="programming&Filtering=free-ebooks');
 List<BookEntity> books = getBooksList(data);
  return books;

  }}