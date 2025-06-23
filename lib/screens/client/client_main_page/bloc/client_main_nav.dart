
// app/bottom_nav_bar/nav_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientMainNav extends Cubit<int> {
  ClientMainNav([int initialIndex = 0]) : super(initialIndex);


  void updateIndex(int newIndex) => emit(newIndex);
}
