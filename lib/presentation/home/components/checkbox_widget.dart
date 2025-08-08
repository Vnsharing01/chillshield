
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Row(
          children: checkboxes,
        )
      ],
    );
  }
}
