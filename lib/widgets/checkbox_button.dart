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
    this.isEnabled = true,
  });

  final void Function(int value)? onTap;
  final String? text;
  final int value;
  final int selectedValue;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final selected = value == selectedValue;
    return Expanded(
      child: AbsorbPointer(
        absorbing: !isEnabled!,
        child: Material(
          elevation: isEnabled! ? 1 : 0.5,
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
                color: !isEnabled!
                    ? AppClolors.buttonDisabled.withOpacity(0.7)
                    : !selected
                        ? AppClolors.checkboxBg
                        : AppClolors.selected,
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
      ),
    );
  }
}
