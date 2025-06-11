import 'package:bloc/bloc.dart';
import 'package:endeavors/screens/dash_board/client/data/model/dash_board_person_model.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  bool _isGridView = true;
  List<ClientPersonModel> _personList = [];

  ClientBloc() : super(ClientInitial()) {
    on<LoadClientData>(_onLoadClientData);
    on<ToggleViewType>(_onToggleViewType);
    on<ClientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onToggleViewType(ToggleViewType event, Emitter<ClientState> emit) {
    _isGridView = event.isGridView;
    emit(ClientLoaded(_personList, _isGridView));
  }

  void _onLoadClientData(
      LoadClientData event, Emitter<ClientState> emit) {
    emit(ClientLoading());

    _personList = List.generate(
      12,
          (index) => ClientPersonModel(
        name: index % 2 == 0 ? "John Wills" : "Mark William",
        caseId: "ABC!2323",
        jobStatus: index % 2 == 0 ? "Employed" : "Resume",
        avatarUrl: index % 2 == 0
            ? "assets/image/Female.png"
            : "assets/image/male_2.png",
      ),
    );

    emit(ClientLoaded(_personList, _isGridView));
  }
}
