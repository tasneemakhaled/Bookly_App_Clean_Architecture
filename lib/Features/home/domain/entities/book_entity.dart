import 'package:hive_ce/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity { 
   // data representation of ui not api
   @HiveField(0)
final String? bookId;
@HiveField(1)
final String? image;
@HiveField(2)
final String title;
@HiveField(3)
final String? authorName;
@HiveField(4)
final String? price;
@HiveField(5)
final String? rating;

  BookEntity({required this.image, required this.title, required this.authorName, required this.price, required this.rating, required this.bookId}); 

}

// entity is the start point in domain layer