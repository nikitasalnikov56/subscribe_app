part of 'selected_list_tile_bloc.dart';

@immutable
sealed class SelectedListTileEvent {}

class SelectedListTileSelectedEvent extends SelectedListTileEvent{
  final int index;
  final bool isSelected;
  SelectedListTileSelectedEvent(this.index, this.isSelected);
}