import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_detail_event.dart';
part 'client_detail_state.dart';

class ClientDetailBloc extends Bloc<ClientDetailEvent, ClientDetailState> {
  ClientDetailBloc() : super(ClientDetailInitial()) {
    on<ClientDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
