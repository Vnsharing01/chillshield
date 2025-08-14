import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    super.key,
    required this.checkboxes,
    required this.title,
  });
  final List<Widget> checkboxes;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.label(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: checkboxes,
        ),
      ],
    );
  }
}
