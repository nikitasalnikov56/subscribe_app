import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_list_tile_event.dart';
part 'selected_list_tile_state.dart';

class SelectedListTileBloc extends Bloc<SelectedListTileEvent, SelectedListTileState> {
  SelectedListTileBloc() : super(SelectedListTileInitial()) {
    on<SelectedListTileSelectedEvent>((event, emit) {
      emit(SelectedListTileSelectedState(currentIndex: event.index, isSelected: event.isSelected ));
    });
  }
}
