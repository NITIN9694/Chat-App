import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc() : super(ClientHomeInitial()) {
    on<ClientHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
