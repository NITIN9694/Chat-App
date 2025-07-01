import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_support_event.dart';

part 'client_support_state.dart';

class ClientSupportBloc extends Bloc<ClientSupportEvent, ClientSupportState> {
  ClientSupportBloc() : super(ClientSupportInitial()) {
    on<ToggleGroup>((event, emit) {
      final current = state is FaqState ? state as FaqState : null;
      emit(FaqState(
        expandedGroupIndex: current?.expandedGroupIndex == event.groupIndex ? null : event.groupIndex,
        expandedQuestionIndex: null, // reset question on group change
      ));
    });

    on<ToggleQuestion>((event, emit) {
      final current = state is FaqState ? state as FaqState : null;
      emit(FaqState(
        expandedGroupIndex: current?.expandedGroupIndex,
        expandedQuestionIndex: current?.expandedQuestionIndex == event.questionIndex ? null : event.questionIndex,
      ));
    });
    on<ClientSupportEvent>((event, emit) {});
  }
}
