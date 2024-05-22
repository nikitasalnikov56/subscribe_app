import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personafication_event.dart';
part 'personafication_state.dart';

class PersonaficationBloc
    extends Bloc<PersonaficationEvent, PersonaficationState> {
  PersonaficationBloc() : super(PersonaficationInitial()) {
    on<PersonaficationLoadedEvent>(_onPersonaficationLoadedEvent);
  }

  Future<void> _onPersonaficationLoadedEvent(PersonaficationLoadedEvent event,
      Emitter<PersonaficationState> emit) async {
    double progress = 0.0;
    List<String> messages = [];

    for (int cycle = 0; cycle < 4; cycle++) {
      while (progress < 1.0) {
        await Future.delayed(const Duration(milliseconds: 500));
        progress += 0.1;
        emit(PersonaficationLoadedState(
            progress: progress, cycle: cycle, messages: messages));
      }
      progress = 0.0;
      if (cycle == 1) {
        messages.add('Curating your ideal interface');
      } else if (cycle == 2) {
        messages.add('Molding the app to your taste');
      } else if (cycle == 3) {
        messages.add('Shaping every detail to fit');
      }
      // messages.add('Cycle ${cycle + 1} complete');
    }

    emit(PersonaficationCompleteState(messages: messages));
  }
}
