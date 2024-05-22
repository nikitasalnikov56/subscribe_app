part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationSwitchState extends NotificationState {
  final bool value;
  NotificationSwitchState({required this.value});
}
