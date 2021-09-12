import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/cubit/states_app.dart';
import 'package:news_app/network/local/cahce_helper.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(IntialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark =false;
  void changeMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
    }else{
      isDark =!isDark;
    }
    CacheHelper.putData(key: 'isDark',value: isDark).then((value){
      emit(ChangeAppMode());
    });

  }

}