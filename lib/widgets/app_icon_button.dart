import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 28,
        color: AppClolors.btnBackground,
      ),
    );
  }
}
