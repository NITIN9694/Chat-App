import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_calendar_event.dart';
part 'client_calendar_state.dart';

class ClientCalendarBloc extends Bloc<ClientCalendarEvent, ClientCalendarState> {
  ClientCalendarBloc() : super(ClientCalendarInitial()) {
    on<ClientCalendarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
