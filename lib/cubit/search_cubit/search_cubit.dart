import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchInitial());
}
