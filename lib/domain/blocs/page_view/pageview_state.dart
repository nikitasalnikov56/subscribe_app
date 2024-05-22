part of 'pageview_bloc.dart';

@immutable
sealed class PageviewState {}

final class PageviewInitial extends PageviewState {}

class PageViewChanged extends PageviewState {
  final int currentIndex;

  PageViewChanged({required this.currentIndex});
}
