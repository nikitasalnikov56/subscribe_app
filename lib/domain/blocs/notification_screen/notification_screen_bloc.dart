import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/ui/resources/app_arrays.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_screen_event.dart';
part 'notification_screen_state.dart';

class NotificationScreenBloc extends Bloc<NotificationScreenEvent, NotificationScreenState> {
  NotificationScreenBloc() : super(NotificationScreenInitial()) {
    on<NotificationScreenSwitchEvent>(_onSwitchEvent);
    on<NotificationScreenLoadEvent>(_onLoadEvent);
    add(NotificationScreenLoadEvent()); // Trigger initial load
  }

  void _onSwitchEvent(NotificationScreenSwitchEvent event, Emitter<NotificationScreenState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification_${event.index}', event.value);

    final currentState = state;
    if (currentState is NotificationScreenLoaded) {
      final newSwitchStates = Map<int, bool>.from(currentState.switchStates);
      newSwitchStates[event.index] = event.value;
      emit(NotificationScreenLoaded(switchStates: newSwitchStates));
    }
  }

  void _onLoadEvent(NotificationScreenLoadEvent event, Emitter<NotificationScreenState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<int, bool> switchStates = {};

    for (int i = 0; i < AppArrays.notificationTitles.length; i++) {
      switchStates[i] = prefs.getBool('notification_$i') ?? false;
    }

    emit(NotificationScreenLoaded(switchStates: switchStates));
  }
}