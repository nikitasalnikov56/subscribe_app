part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}
 class NotificationSwitchEvent extends  NotificationEvent{
  final bool value;
  NotificationSwitchEvent(this.value);
 }
