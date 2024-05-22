part of 'notification_screen_bloc.dart';

@immutable
sealed class NotificationScreenEvent {}

class NotificationScreenSwitchEvent extends NotificationScreenEvent {
  final int index;
  final bool value;

  NotificationScreenSwitchEvent({required this.index, required this.value});
}

class NotificationScreenLoadEvent extends NotificationScreenEvent {}