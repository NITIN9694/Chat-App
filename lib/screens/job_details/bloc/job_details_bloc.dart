import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc() : super(JobDetailsInitial()) {
    on<JobDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
