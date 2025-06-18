
// app/bottom_nav_bar/nav_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit([int initialIndex = 0]) : super(initialIndex);


  void updateIndex(int newIndex) => emit(newIndex);
}
