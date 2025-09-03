import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonTile,
    this.backgroundColor,
    this.textColor,
  });
  final void Function() onPressed;
  final String buttonTile;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: backgroundColor ?? AppClolors.btnBackground,
        elevation: 2,
      ),
      child: Text(
        buttonTile,
        style: AppTextStyle.button(
          fontSize: 24,
          color: textColor ?? AppClolors.white,
        ),
      ),
    );
  }
}
