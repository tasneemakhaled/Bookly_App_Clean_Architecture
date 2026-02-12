import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

void saveBooksData(List<BookEntity> books,String boxName) {
    var box=Hive.box(boxName);
    box.addAll(books);
  }