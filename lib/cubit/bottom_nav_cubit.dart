import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> { //int is use as a state 
  BottomNavCubit() : super(0); //here we use initial state as 0 

  void updateIndex(int index){
    emit(index); //update index
  }
}