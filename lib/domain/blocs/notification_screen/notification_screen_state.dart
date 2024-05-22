part of 'notification_screen_bloc.dart';

@immutable
sealed class NotificationScreenState {}

final class NotificationScreenInitial extends NotificationScreenState {}


final class NotificationScreenLoaded extends NotificationScreenState {
  final Map<int, bool> switchStates;

  NotificationScreenLoaded({required this.switchStates});
}