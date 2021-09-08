import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/news_layout.dart';

import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner:false ,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange
        ),
        appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
        elevation:  0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )
      ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 20.0

        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NewsLayout(),
    );
  }
}

