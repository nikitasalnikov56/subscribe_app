import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/selected_listtile/selected_list_tile_bloc.dart';
import 'package:flutter_application_1/ui/resources/app_arrays.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeOrPaidVersion extends StatelessWidget {
  const FreeOrPaidVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedListTileBloc, SelectedListTileState>(
      builder: (context, state) {
        if (state is SelectedListTileSelectedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Would you prefer a free version of the app with limited features or a paid version with premium features?',
                textAlign: TextAlign.center,
                style: AppStyle.fontStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 55),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Card(
                      color: AppColors.blueWithOpacity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: state.isSelected == true &&
                                  state.currentIndex == i
                              ? AppColors.borderColor
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        selected: state.isSelected,
                        onTap: () {
                          context
                              .read<SelectedListTileBloc>()
                              .add(SelectedListTileSelectedEvent(i, true));
                        },
                        title: Center(
                          child: Text(AppArrays.freeOrPaid[i],
                              style: AppStyle.fontStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 30),
                  itemCount: AppArrays.freeOrPaid.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              'Error',
              style: AppStyle.fontStyle,
            ),
          );
        }
      },
    );
  }
}
