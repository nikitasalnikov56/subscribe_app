import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/controllers/app_controllers.dart';
import 'package:flutter_application_1/ui/resources/app_arrays.dart';
import 'package:flutter_application_1/ui/resources/app_images.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:go_router/go_router.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              context.go(AppRoutes.testPage);
            },
            child: Text(
              'Skip',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 25, right: 25, bottom: 50),
        child: AppCarousel(),
      ),
    );
  }
}

class AppCarousel extends StatefulWidget {
  const AppCarousel({super.key});

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            carouselController: AppControllers.controller,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: double.infinity,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            itemBuilder: (context, i, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 46),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      AppImages.images[i],
                      fit: BoxFit.cover,
                      width: 400,
                    ),
                    SizedBox(height: i == 2 ? 46 : 20),
                    Text(
                      AppArrays.titles[i],
                      style: AppStyle.fontStyle
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 280,
                      child: Text(
                        AppArrays.subTitles[i],
                        textAlign: TextAlign.center,
                        style: AppStyle.fontStyle.copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            },
            itemCount: AppImages.images.length,
          ),
        ),
        CarouselIndicators(current: _current),
        const SizedBox(height: 30,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration:  BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.blue,
                  AppColors.darkBlue,
                ],
              ),
              borderRadius: BorderRadius.circular(27)
            ),
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.testPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                'Get started',
                style: AppStyle.fontStyle.copyWith(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselIndicators extends StatelessWidget {
  const CarouselIndicators({super.key, required this.current});

  final int current;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: AppImages.images.asMap().entries.map((entry) {
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
