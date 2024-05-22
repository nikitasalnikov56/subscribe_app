import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationSwitchEvent>(_onNotificationSwitchEvent);

    // Load the initial value from SharedPreferences
    _loadInitialNotificationValue();
  }

  void _onNotificationSwitchEvent(NotificationSwitchEvent event, Emitter<NotificationState> emit) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('notification', event.value);
    final bool newValue = pref.getBool('notification') ?? false;

    emit(NotificationSwitchState(value: newValue));
  }

  void _loadInitialNotificationValue() async {
    final pref = await SharedPreferences.getInstance();
    final bool initialValue = pref.getBool('notification') ?? false;
    add(NotificationSwitchEvent(initialValue));
  }
}