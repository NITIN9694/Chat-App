import 'package:bloc/bloc.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/data/model/dash_board_person_model.dart';
import 'package:meta/meta.dart';

part 'case_manager_event.dart';
part 'case_manager_state.dart';

class CaseManagerBloc extends Bloc<CaseManagerEvent, CaseManagerState> {
  bool _isGridView = true;
  List<CaseManagerPersonModel> _personList = [];
  CaseManagerBloc() : super(CaseManagerInitial()) {
    on<LoadCaseManagerData>(_onLoadClientData);
    on<ToggleViewType>(_onToggleViewType);
    on<CaseManagerEvent>((event, emit) {

    });
  }

  void _onToggleViewType(ToggleViewType event, Emitter<CaseManagerState> emit) {
    _isGridView = event.isGridView;
    emit(CaseManagerLoaded(_personList, _isGridView));
  }

  void _onLoadClientData(
      LoadCaseManagerData event, Emitter<CaseManagerState> emit) {
    emit(CaseManagerLoading());

    _personList = List.generate(
      12,
          (index) => CaseManagerPersonModel(
        name: index % 2 == 0 ? "John Wills" : "Mark William",
        caseId: "ABC!2323",
        jobStatus: index % 2 == 0 ? "Employed" : "Resume",
        avatarUrl: index % 2 == 0
            ? "assets/image/Female.png"
            : "assets/image/male_2.png",
      ),
    );

    emit(CaseManagerLoaded(_personList, _isGridView));
  }
}
