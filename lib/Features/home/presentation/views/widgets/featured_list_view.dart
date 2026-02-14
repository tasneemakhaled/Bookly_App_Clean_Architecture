import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/presentation/manager/cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books, required String image});
final List<BookEntity>books;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .3,
    child: ListView.builder(
      itemCount: books.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomBookImage(image: books[index].image ??'',),
        );
      },
    ),
  );
}else if(state is FeaturedBooksFailure ){
return Text(state.errMessage);
}else{
return CircularProgressIndicator();
}
      },
    );
  }
}
