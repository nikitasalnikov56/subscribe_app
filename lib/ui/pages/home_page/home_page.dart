import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/components/list_screens.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/routes/cupertino_route.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: AppColors.navBarColor,
          activeColor: AppColors.blue,
          inactiveColor: AppColors.blueWithOpacity,
          height: 80,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.home),
              activeIcon: SvgPicture.asset(AppIcons.activeHome),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.calendar),
              activeIcon: SvgPicture.asset(AppIcons.activeCalendar),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.notifications),
              activeIcon: SvgPicture.asset(AppIcons.activeNotifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.settings),
              activeIcon: SvgPicture.asset(AppIcons.activeSettings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            routes: CupertinoRoute.routes,
            builder: (context) {
              return ListScreens.screens[index];
            },
          );
        },
      ),
      // BottomNavigationBar(
      //   selectedItemColor: AppColors.blue,
      //   unselectedItemColor: AppColors.blue.withOpacity(0.5),
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   currentIndex: currentIndex,
      //   onTap: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: AppColors.black,
      //       icon: SvgPicture.asset(AppIcons.home),
      //       activeIcon: SvgPicture.asset(AppIcons.activeHome),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: AppColors.black,
      //       icon: SvgPicture.asset(AppIcons.calendar),
      //       activeIcon: SvgPicture.asset(AppIcons.activeCalendar),
      //       label: 'Calender',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: AppColors.black,
      //       icon: SvgPicture.asset(AppIcons.notifications),
      //       activeIcon: SvgPicture.asset(AppIcons.activeNotifications),
      //       label: 'Notifications',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: AppColors.black,
      //       icon: SvgPicture.asset(AppIcons.settings),
      //       activeIcon: SvgPicture.asset(AppIcons.activeSettings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
