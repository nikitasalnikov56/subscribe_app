import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/calendar_screen/calendar_screen.dart';
import 'package:flutter_application_1/ui/pages/home_screen/home_screen.dart';
import 'package:flutter_application_1/ui/pages/notifications_screen/notifications_screen.dart';
import 'package:flutter_application_1/ui/pages/settings_screen/settings_screen.dart';

abstract class ListScreens {
  static List<Widget> screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotificationsScreen(),
    const SettingsScreen()
  ];
}
