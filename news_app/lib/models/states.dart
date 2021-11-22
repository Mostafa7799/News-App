

abstract class NewsStates {}

class NewsInitialStates extends NewsStates{}

class NewsButtonNavStates extends NewsStates{}

class NewsGetBusinessLoadingStates extends NewsStates{}

class NewsGetBusinessSuccess extends NewsStates {}

class NewsGetBusinessError extends NewsStates {
  final String error;

  NewsGetBusinessError(this.error);

}

class NewsGetSportsLoadingStates extends NewsStates{}

class NewsGetSportsSuccess extends NewsStates {}

class NewsGetSportsError extends NewsStates {
  final String error;

  NewsGetSportsError(this.error);

}

class NewsGetScienceLoadingStates extends NewsStates{}

class NewsGetScienceSuccess extends NewsStates {}

class NewsGetScienceError extends NewsStates {
  final String error;

  NewsGetScienceError(this.error);

}
