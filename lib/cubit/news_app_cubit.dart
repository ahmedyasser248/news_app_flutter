import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settingsScreen/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(NewsBottomNavState());
  }
  List<dynamic>business = [];
  void getBusiness(){
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'

    } ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError(
            (onError){ 
              print(onError.toString());
              emit(NewsGetBusinessErrorState(onError.toString()));
            });
  }

}