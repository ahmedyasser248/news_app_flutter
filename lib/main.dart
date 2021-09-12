import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/cubit/states_app.dart';
import 'package:news_app/layout/news_layout.dart';

import 'cubit/app_cubit.dart';
import 'network/dio_helper.dart';
import 'network/local/cahce_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

   final bool? isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
       BlocProvider(
       create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()
    ),
        BlocProvider(
        create : (BuildContext context )=>AppCubit()..changeMode(
        fromShared:  isDark
    ),)
    ] , child: BlocConsumer<AppCubit,States>(
      listener: (context, state){},
      builder: (context,state){
        return   MaterialApp(
          debugShowCheckedModeBanner:false ,

          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange
            ),
            appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
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
          darkTheme: ThemeData(
            scaffoldBackgroundColor: HexColor('333739'),
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange
            ),
            appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle:  SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light
                ),
                backgroundColor: HexColor('333739'),
                elevation:  0.0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                )
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey

            ),
            textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white

                )
            ),
          ),
          themeMode: AppCubit.get(context).isDark ?ThemeMode.dark :ThemeMode.light ,
          home: NewsLayout(),
        );

      },
    )
    );
  }
}

