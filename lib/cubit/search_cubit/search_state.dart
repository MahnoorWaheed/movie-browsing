import 'package:movie_browsing/models/movie_model.dart';

abstract class SearchCubitState {}
class SearchInitial extends SearchCubitState{}
class SearchLoading extends SearchCubitState{}
class SearchLoaded extends SearchCubitState{
  List<Movie> movieList = [];
  SearchLoaded({required this.movieList});
}
class SearchError extends SearchCubitState{
  String errorMsg = "";
  SearchError({required this.errorMsg});
}