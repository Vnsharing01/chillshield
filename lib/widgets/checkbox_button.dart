import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class BtnCheckbox extends StatelessWidget {
  const BtnCheckbox({
    super.key,
    this.onTap,
    this.text,
    required this.value,
    required this.selectedValue,
  });

  final void Function(int value)? onTap;
  final String? text;
  final int value;
  final int selectedValue;

  @override
  Widget build(BuildContext context) {
    final selected = value == selectedValue;
    return Expanded(
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            onTap?.call(value);
          },
          radius: 16,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: !selected ? AppClolors.checkboxBg : AppClolors.selected,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.center,
            child: Text(
              text ?? '',
              style: AppTextStyle.label(),
            ),
          ),
        ),
      ),
    );
  }
}
