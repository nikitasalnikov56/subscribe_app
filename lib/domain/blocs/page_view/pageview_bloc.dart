import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/selected_listtile/selected_list_tile_bloc.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'pageview_event.dart';
part 'pageview_state.dart';

class PageviewBloc extends Bloc<PageviewEvent, PageviewState> {
  int currentIndex = 0;
  final int totalPages;
  final SelectedListTileBloc selectedListTileBloc;
  final BuildContext context;
  PageviewBloc({
    required this.totalPages,
    required this.selectedListTileBloc,
    required this.context,
  }) : super(PageviewInitial()) {
    on<PageViewNextEvent>((event, emit) {
      if (currentIndex < totalPages - 1 &&
          (selectedListTileBloc.state as SelectedListTileSelectedState)
                  .isSelected ==
              true) {
        currentIndex++;
        emit(PageViewChanged(currentIndex: currentIndex));
      } else if (currentIndex == totalPages - 1) {
        add(NavigateToNextScreenEvent());
      } else {
        print('Something wrong');
      }
    });
    on<NavigateToNextScreenEvent>((event, emit) {
      context.go(AppRoutes.personaficationPage);
    });
  }
}
