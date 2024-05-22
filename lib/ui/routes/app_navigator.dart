import 'package:flutter_application_1/ui/pages/carousel_widget/carousel_widget.dart';
import 'package:flutter_application_1/ui/pages/home_page/home_page.dart';
import 'package:flutter_application_1/ui/pages/personafication_page/personafication_page.dart';
import 'package:flutter_application_1/ui/pages/test_page/test_page.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.carouselScreen,
        builder: (context, state) => const CarouselWidget(),
      ),
      GoRoute(
        path: AppRoutes.testPage,
        builder: (context, state) => const TestPage(),
      ),
      GoRoute(
        path: AppRoutes.personaficationPage,
        builder: (context, state) => const PersonaficationPage(),
      ), GoRoute(
        path: AppRoutes.homePage,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
