abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  late final  String error;
  NewsGetBusinessErrorState(this.error);
}
