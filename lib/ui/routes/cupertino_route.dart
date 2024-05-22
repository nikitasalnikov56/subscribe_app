import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/profile_page/profile_page.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';

class CupertinoRoute {
  static String initRoute = AppRoutes.profile;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.profile: (_) => const ProfilePage(),


    };
  }
}