import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/style/app_colors.dart';

abstract class AppStyle{
  static const fontStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProText',
    color: AppColors.white,
  );
}