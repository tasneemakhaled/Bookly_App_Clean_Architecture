import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

void saveBooksData(List<BookEntity> books,String boxName) {
    var box=Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }