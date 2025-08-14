import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/font_style.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title({
    double? fontSize,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color ?? AppClolors.txtMainColor,
        fontFamily: fontTitleFamily(),
      );

  static TextStyle label({
    double? fontSize,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? AppClolors.label,
        fontFamily: fontLabelFamily(),
      );

  static TextStyle body({
    double? fontSize,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppClolors.label,
        fontFamily: fontBodyFamily(),
      );

  static TextStyle button({
    double? fontSize,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppClolors.textBlack,
        fontFamily: fontButtonFamily(),
      );
}
