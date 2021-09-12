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

  ];
  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void changeBottomNavBar(int index){
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    currentIndex = index;
    emit(NewsBottomNavState());
  }
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science =[];
  List<dynamic> search = [];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apiKey':'73afb981c35c48e2ac7665b9c78e80f2'

    } ).then((value) {
      business = value.data['articles'];
      print(business[0]['titles']);
      emit(NewsGetBusinessSuccessState());
    }).catchError(
            (onError){ 
              print(onError.toString());
              emit(NewsGetBusinessErrorState(onError.toString()));
            });
  }
  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:{
        'country':'eg',
        'category':'sports',
        'apiKey':'73afb981c35c48e2ac7665b9c78e80f2'

      } ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['titles']);
        emit(NewsGetSportsSuccessState());
      }).catchError(
              (onError){
            print(onError.toString());
            emit(NewsGetSportsErrorState(onError.toString()));
          });
    }else{
      emit(NewsGetSportsSuccessState());
    }

  }
  void getScience(){
    emit(NewsGetScienceLoadingStates());
    if(science.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:{
        'country':'eg',
        'category':'science',
        'apiKey':'73afb981c35c48e2ac7665b9c78e80f2'

      } ).then((value) {
        science = value.data['articles'];
        print(sports[0]['titles']);
        emit(NewsGetScienceSuccessStates());
      }).catchError(
              (onError){
            print(onError.toString());
            emit(NewsGetScienceErrorStates(onError.toString()));
          });
    }else{
      emit(NewsGetScienceSuccessStates());
    }

  }

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search = [];
      DioHelper.getData(url: 'v2/everything', query:{
        'q':'$value',
        'apiKey':'73afb981c35c48e2ac7665b9c78e80f2'

      } ).then((value) {
        search = value.data['articles'];
        print(sports[0]['titles']);
        emit(NewsGetSearchSuccessState());
      }).catchError(
              (onError){
            print(onError.toString());
            emit(NewsGetSearchErrorState(onError.toString()));
          });

  }

}