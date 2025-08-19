import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class RadioCheckAudioWidget extends StatefulWidget {
  const RadioCheckAudioWidget({
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
  State<RadioCheckAudioWidget> createState() => _RadioCheckAudioWidgetState();
}

class _RadioCheckAudioWidgetState extends State<RadioCheckAudioWidget> {
  @override
  Widget build(BuildContext context) {
    final selected = widget.value == widget.selectedValue;
    return ListTile(
      onTap: () {
        widget.onTap?.call(widget.value);
      },
      title: Text(
        widget.text ?? '',
        style: AppTextStyle.label(fontSize: 20),
      ),
      trailing: Icon(
        !selected
            ? Icons.check_box_outline_blank_rounded
            : Icons.check_box_rounded,
        color: AppClolors.txtMainColor,
      ),
    );
  }
}
