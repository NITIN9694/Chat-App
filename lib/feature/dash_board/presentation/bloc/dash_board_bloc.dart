import 'package:bloc/bloc.dart';
import 'package:endeavors/feature/dash_board/data/dash_board_person_model.dart';
import 'package:meta/meta.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardInitial()) {
    on<LoadDashBoardData>(_onLoadDashBoardData);
    on<DashBoardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onLoadDashBoardData(LoadDashBoardData event, Emitter<DashBoardState> emit){
    emit(DashBoardLoading());
    final people = List.generate(12, (index)=>DashBoardPersonModel(
        name: index%2==0?"Jhon Wills":"Mark William",
        caseId: "ABC!2323",
        jobStatus: index%2==0?"Employed":"Resume", avatarUrl: index%2==0?
      "assets/image/Female.png":
        "assets/image/male_2.png"
    ));

    emit(DashBoardLoaded(people));
  }
}
