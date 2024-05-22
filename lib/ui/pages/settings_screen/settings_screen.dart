import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/settings_notification/notification_bloc.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Container(
        color: AppColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 94),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 45),
            BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                bool value = false;
                if (state is NotificationSwitchState) {
                  value = state.value;
                }
                return ListItems(
                  leftWidget: Text(
                    'Notifications',
                    style: AppStyle.fontStyle.copyWith(fontSize: 20),
                  ),
                  rightWidget: CupertinoSwitch(
                    value: value,
                    onChanged: (value) {
                      context
                          .read<NotificationBloc>()
                          .add(NotificationSwitchEvent(value));
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ListItems(
              leftWidget: TextButton(
                onPressed: () {},
                child: Text(
                  'Support',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 20,
                    color: const Color(0xFF007AFF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListItems(
              leftWidget: TextButton(
                onPressed: () {},
                child: Text(
                  'Share app',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 20,
                    color: const Color(0xFF007AFF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListItems(
              leftWidget: TextButton(
                onPressed: () {},
                child: Text(
                  'Rate us',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 20,
                    color: const Color(0xFF007AFF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListItems(
              leftWidget: TextButton(
                onPressed: () {},
                child: Text(
                  'Delete account',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 20,
                    color: const Color(0xFFFF4F4F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.leftWidget, this.rightWidget});
  final Widget leftWidget;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftWidget,
            rightWidget ?? const SizedBox(),
          ],
        ),
        Divider(
          color: AppColors.white,
        )
      ],
    );
  }
}
