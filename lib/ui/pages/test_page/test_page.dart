import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/page_view/pageview_bloc.dart';
import 'package:flutter_application_1/domain/blocs/selected_listtile/selected_list_tile_bloc.dart';
import 'package:flutter_application_1/domain/models/controllers/app_controllers.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_application_1/ui/widgets/test_screens/test_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final testScreens = TestScreens();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedListTileBloc()
            ..add(SelectedListTileSelectedEvent(0, false)),
        ),
        BlocProvider(
          create: (context) => PageviewBloc(
            totalPages: testScreens.screens.length,
            selectedListTileBloc: context.read<SelectedListTileBloc>(),
            context: context,
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 50),
          child: TestPageCarouselBody(testScreens: testScreens),
        ),
      ),
    );
  }
}

class TestPageCarouselBody extends StatelessWidget {
  const TestPageCarouselBody({super.key, required this.testScreens});
  static int current = 0;
  final TestScreens testScreens;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageviewBloc, PageviewState>(
      builder: (context, state) {
        int currentPageIndex = 0;
        if (state is PageViewChanged) {
          currentPageIndex = state.currentIndex;
          AppControllers.pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TestIndicators(
              testScreens: testScreens,
              current: currentPageIndex,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: PageView(
                controller: AppControllers.pageController,
                children: testScreens.screens,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.blue,
                        AppColors.darkBlue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<PageviewBloc>().add(PageViewNextEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: AppStyle.fontStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TestIndicators extends StatelessWidget {
  const TestIndicators({
    super.key,
    required this.current,
    required this.testScreens,
  });
  final int current;
  final TestScreens testScreens;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: testScreens.screens.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            AppControllers.controller.animateToPage(entry.key);
          },
          child: Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              color: current == entry.key
                  ? AppColors.activeColor
                  : AppColors.blueWithOpacity,
              shape: BoxShape.circle,
            ),
          ),
        );
      }).toList(),
    );
  }
}
