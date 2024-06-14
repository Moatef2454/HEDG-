

import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  void changeBottomNave(int index,context){
    currantScreen = index;
    emit(BottomNaveState());
  }
}
int currantScreen=0;