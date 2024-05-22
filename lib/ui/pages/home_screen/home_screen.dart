import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/resources/app_arrays.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/resources/app_images.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              'Subscription',
              style: AppStyle.fontStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Per month 48\$',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 20,
                color: const Color(0xFFD4D4D4),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.iconPlus),
            ),
          ),
          const SizedBox(height: 36),
          Text(
            'Reminder',
            style: AppStyle.fontStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Container(
                  width: 170,
                  // height: 100,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Image.asset(
                          AppImages.notificationImages[i],
                          width: 32,
                          height: 32,
                        ),
                        title: Center(
                          child: Text(
                            AppArrays.notificationTitles[i],
                            style: AppStyle.fontStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            '6\$',
                            style: AppStyle.fontStyle.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF4A4A4A)),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 16,
                            startAngle: 1,
                            progressColor: AppColors.white,
                            backgroundColor: const Color(0xFF33358F),
                            percent: 0.3,
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              '5',
                              style: AppStyle.fontStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 9),
                          Text(
                            '5 days remaining',
                            style: AppStyle.fontStyle.copyWith(
                              fontSize: 11,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, i) => const SizedBox(width: 15),
              itemCount: 3,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Active',
                      style: AppStyle.fontStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Inactive',
                      style: AppStyle.fontStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF828282),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) {
                return Card(
                  color: AppColors.cardColor,
                  child: ListTile(
                    leading: Image.asset(AppImages.youtube),
                    title: Text(
                      'YouTube',
                      style: AppStyle.fontStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'Last paid 9\$ on 10 October,2022',
                      style: AppStyle.fontStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Transform.rotate(
                        angle: -1.5708,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 15,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
