import 'package:bloc/bloc.dart';
import 'package:endeavors/feature/dash_board/data/dash_board_person_model.dart';
import 'package:meta/meta.dart';

part 'dash_board_event.dart';

part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  bool _isGridView = true;
  List<DashBoardPersonModel> _personList = [];

  DashBoardBloc() : super(DashBoardInitial()) {
    on<LoadDashBoardData>(_onLoadDashBoardData);
    on<ToggleViewType>(_onToggleViewType);
    on<DashBoardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onToggleViewType(ToggleViewType event, Emitter<DashBoardState> emit) {
    _isGridView = event.isGridView;
    emit(DashBoardLoaded(_personList, _isGridView));
  }

  void _onLoadDashBoardData(
      LoadDashBoardData event, Emitter<DashBoardState> emit) {
    emit(DashBoardLoading());

    _personList = List.generate(
      12,
      (index) => DashBoardPersonModel(
        name: index % 2 == 0 ? "John Wills" : "Mark William",
        caseId: "ABC!2323",
        jobStatus: index % 2 == 0 ? "Employed" : "Resume",
        avatarUrl: index % 2 == 0
            ? "assets/image/Female.png"
            : "assets/image/male_2.png",
      ),
    );

    emit(DashBoardLoaded(_personList, _isGridView));
  }
}
