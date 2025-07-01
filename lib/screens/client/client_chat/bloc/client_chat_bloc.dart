import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_chat_event.dart';
part 'client_chat_state.dart';

class ClientChatBloc extends Bloc<ClientChatEvent, ClientChatState> {
  ClientChatBloc() : super(ClientChatInitial()) {
    on<ClientChatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
