part of 'pageview_bloc.dart';

@immutable
sealed class PageviewEvent {}
class PageViewNextEvent extends PageviewEvent {}
class NavigateToNextScreenEvent extends PageviewEvent {}
