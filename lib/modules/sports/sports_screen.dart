import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';
class SportsScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit,NewsStates>(
        builder: (context,state){
          var list = NewsCubit.get(context).sports;
          if(list.length>0){
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildArticleItem(list[index],context),
                separatorBuilder: (context,index)=>myDivider(),
                itemCount: 10);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
        listener: (context,state){});
  }
}