import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/dio_helper.dart';

class NewsLayout extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=>NewsCubit()..getBusiness(),
      
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title:Text(
              'News App',
            ),
            actions: [
              IconButton(icon: Icon(Icons.search),onPressed: (){},)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              DioHelper.getData(url: 'v2/top-headlines', query:{
                'country':'eg',
                'category':'business',
                'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'

              } ).then((value) => print(value.data.toString())).catchError(
                      (onError)=> print(onError.toString()));
            },
            child: Icon(
              Icons.add,

            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap:(index){
              cubit.changeBottomNavBar(index);
            } ,
            items: cubit.bottomItems,
          ),

        );
        }
      ),
    );
  }
}