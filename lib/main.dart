import 'package:bookly_app_clean_architecture/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean_architecture/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean_architecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:bookly_app_clean_architecture/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_ce_flutter/adapters.dart'; 

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
 await Hive.openBox<BookEntity>(kFeaturedbox);
 await Hive.openBox<BookEntity>(kNewestbox);
  runApp(const Bookly());
  
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => FeaturedBooksCubit(FetchFeaturedBooksUseCase(
          homeRepo: HomeRepoImpl(
            homeRemoteDataSource:
             HomeRemoteDataSourceImpl(
              apiService: ApiService(dio: Dio())), homeLocalDataSource: HomeLocalDataSourceimpl()),
        ),
        ),
        ),
        BlocProvider( create: (context) => NewestBooksCubit(
          FetchNewestBooksUseCase(
            homeRepo: HomeRepoImpl(
              homeRemoteDataSource: HomeRemoteDataSourceImpl(
                apiService: ApiService(
                  dio: Dio())), 
                  homeLocalDataSource: HomeLocalDataSourceimpl()),
        ),
        ),
        ),
      ],
   
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          ),
        ),
    );
  }
}
// dependency injection ==> get it package