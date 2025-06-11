
// app/bottom_nav_bar/nav_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0);

  void updateIndex(int newIndex) => emit(newIndex);
}
