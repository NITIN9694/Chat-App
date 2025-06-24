import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_learn_event.dart';
part 'client_learn_state.dart';

class ClientLearnBloc extends Bloc<ClientLearnEvent, ClientLearnState> {
  ClientLearnBloc() : super(ClientLearnInitial()) {
    on<ClientLearnEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
