import 'package:bookly_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/features/home/presentation/manager/cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  
  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  bool isLoading = false;
   var nextPage=1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Calculate 70% of the total scrollable length
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    
    if (currentScroll >= maxScroll * 0.7) {
      // Trigger your request here (e.g., fetch more books)
      // Use a flag or check cubit state to prevent duplicate requests while scrolling
      context.read<FeaturedBooksCubit>().fetchFeaturedBooks(pageNumber: nextPage++); 
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Always dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              controller: _scrollController, // Attach the controller here
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(
                    image: state.books[index].image ?? '',
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}