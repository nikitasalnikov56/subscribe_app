part of 'selected_list_tile_bloc.dart';

@immutable
sealed class SelectedListTileState {}

final class SelectedListTileInitial extends SelectedListTileState {}

class SelectedListTileSelectedState extends SelectedListTileState{
  final int currentIndex;
  final bool isSelected;

  SelectedListTileSelectedState({required this.currentIndex,  this.isSelected = false});
}
