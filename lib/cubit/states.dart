abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  late final  String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  late final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceLoadingStates extends NewsStates{}
class NewsGetScienceSuccessStates extends NewsStates{}
class NewsGetScienceErrorStates extends NewsStates{
 late final String error;
  NewsGetScienceErrorStates(this.error);
}
class AppChangeModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  late final String error;
  NewsGetSearchErrorState(this.error);
}