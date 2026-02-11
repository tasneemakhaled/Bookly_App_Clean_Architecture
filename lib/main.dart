import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:bookly_app_clean_architecture/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce/hive.dart';

void main() async{
  runApp(const Bookly());
  Hive.registerAdapter(BookEntityAdapter());
 await Hive.openBox(kFeaturedbox);
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
