part of 'personafication_bloc.dart';

@immutable
sealed class PersonaficationState {}

final class PersonaficationInitial extends PersonaficationState {}
class PersonaficationLoadedState extends PersonaficationState {
  final double progress;
  final int cycle;
  final List<String> messages;

  PersonaficationLoadedState({
    required this.progress,
    required this.cycle,
    required this.messages,
  });
}

final class PersonaficationCompleteState extends PersonaficationState {
  final List<String> messages;

  PersonaficationCompleteState({required this.messages});
}