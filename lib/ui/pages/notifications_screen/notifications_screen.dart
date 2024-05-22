import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/notification_screen/notification_screen_bloc.dart';
import 'package:flutter_application_1/ui/resources/app_arrays.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/resources/app_images.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationScreenBloc(),
      child: BlocBuilder<NotificationScreenBloc, NotificationScreenState>(
        builder: (context, state) {
          if (state is NotificationScreenLoaded) {
            return Container(
              color: AppColors.black,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 94),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: AppStyle.fontStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppIcons.iconPlus,
                          width: 34,
                          height: 34,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        final bool switchValue = state.switchStates[i] ?? false;
                        return Card(
                          color: AppColors.cardColor,
                          child: ListTile(
                            title: Text(
                              AppArrays.notificationTitles[i],
                              style: AppStyle.fontStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.smallCalendar),
                                  TextButton(
                                    child: Text(
                                      'Set reminder',
                                      style: AppStyle.fontStyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.activeColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 365)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            leading:
                                Image.asset(AppImages.notificationImages[i]),
                            trailing: CupertinoSwitch(
                              activeColor: AppColors.activeColor,
                              value: switchValue,
                              onChanged: (value) {
                                context.read<NotificationScreenBloc>().add(
                                    NotificationScreenSwitchEvent(
                                        index: i, value: value));
                              },
                            ),
                          ),
                        );
                      },
                      itemCount: AppImages.notificationImages.length,
                      separatorBuilder: (context, i) =>
                          const SizedBox(height: 32),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
              child: CircularProgressIndicator()); // Loading state
        },
      ),
    );
  }
}
