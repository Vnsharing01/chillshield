import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/formats.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class DurationWidget extends StatefulWidget {
  const DurationWidget({
    super.key,
    this.duration = Duration.zero,
  });
  final Duration duration;

  @override
  State<DurationWidget> createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Text(
            formatDurationMMSS(widget.duration),
            style: AppTextStyle.title(color: AppClolors.white),
          );
        });
  }
}
