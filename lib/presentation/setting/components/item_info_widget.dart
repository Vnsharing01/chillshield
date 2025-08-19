import 'package:chillshield/presentation/setting/setting_controller.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    super.key,
    required this.controller,
    this.onTap,
    required this.title,
    this.icon,
  });

  final SettingController controller;
  final void Function()? onTap;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyle.label(fontSize: 20),
      ),
      trailing: Icon(
        icon ?? Icons.chevron_right_rounded,
        color: AppClolors.txtMainColor,
      ),
    );
  }
}
