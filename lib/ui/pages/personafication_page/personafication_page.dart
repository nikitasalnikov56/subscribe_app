import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/blocs/personafication/personafication_bloc.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';

class PersonaficationPage extends StatelessWidget {
  const PersonaficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PersonaficationBloc()..add(PersonaficationLoadedEvent()),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 135, left: 25, right: 25, bottom: 55),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<PersonaficationBloc, PersonaficationState>(
              builder: (context, state) {
                double progress = 0.0;
                List<String> messages = [];
                if (state is PersonaficationLoadedState) {
                  progress = state.progress;
                  messages = state.messages;
                } else if (state is PersonaficationCompleteState) {
                  messages = state.messages;
                }
                List<Widget> children = [
                  Text(
                    'Personafication',
                    style: AppStyle.fontStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 47),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0XFF2E435F),
                              Color(0xFF282C47),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: progress),
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, child) {
                          return GradientCircularProgressIndicator(
                            progress: value,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3E68C3),
                                Color(0xFF333993),
                              ],
                            ),
                            size: 140,
                            stroke: 24,
                            backgroundColor: Colors.transparent,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Please wait \nNow we will configure the app \nbased on your answers',
                    textAlign: TextAlign.center,
                    style: AppStyle.fontStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 90),
                ];
                children.addAll(messages
                    .map(
                      (msg) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          msg,
                          style: AppStyle.fontStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.apperarTextColor,
                          ),
                        ),
                      ),
                    )
                    .toList());

                if (state is PersonaficationCompleteState) {
                  children.add(
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
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
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  context.go(AppRoutes.homePage);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Continue',
                                  style:
                                      AppStyle.fontStyle.copyWith(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                  // [
                  //   Text(
                  //     'Personafication',
                  //     style: AppStyle.fontStyle.copyWith(
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 47,
                  //   ),
                  //   Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Container(
                  //         width: 160,
                  //         height: 160,
                  //         padding: const EdgeInsets.all(20),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(80),
                  //           gradient: const LinearGradient(
                  //             colors: [
                  //               Color(0XFF2E435F),
                  //               Color(0xFF282C47),
                  //             ],
                  //           ),
                  //         ),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(180),
                  //             color: AppColors.black,
                  //           ),
                  //         ),
                  //       ),
                  //       TweenAnimationBuilder<double>(
                  //           tween: Tween<double>(begin: 0.0, end: progress),
                  //           duration: const Duration(milliseconds: 500),
                  //           builder: (context, value, child) {
                  //             return GradientCircularProgressIndicator(
                  //               progress: progress,
                  //               gradient: const LinearGradient(
                  //                 colors: [
                  //                   Color(0xFF3E68C3),
                  //                   Color(0xFF333993),
                  //                 ],
                  //               ),
                  //               size: 140,
                  //               stroke: 24,
                  //               backgroundColor: Colors.transparent,
                  //             );
                  //           }),
                  //     ],
                  //   ),

                  // ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    path.addOval(Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width / 3,
      height: size.height / 3,
    ));
    return Path.combine(PathOperation.difference, path, Path());
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
