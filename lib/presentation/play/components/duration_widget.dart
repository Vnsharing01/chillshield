import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/formats.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class DurationWidget extends StatefulWidget {
  const DurationWidget({
    super.key,
    this.duration = Duration.zero,
    this.isPlaying = false,
  });
  final Duration duration;
  final bool isPlaying;

  @override
  State<DurationWidget> createState() => DurationWidgetState();
}

class DurationWidgetState extends State<DurationWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  double _pausedValue = 0;
  Duration duration = Duration.zero;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _pausedValue = animationController.value;
    animationController.addListener(
      () {
        duration = widget.duration * animationController.value;
        setState(() {});
      },
    );

    animationController.addStatusListener(
      (status) {
        if (!mounted) {
          if (status.isCompleted || status.isDismissed) {
            animationController.stop();
          }
        }
      },
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _startDuration(widget.duration);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Text(
            formatDurationMMSS(duration),
            style: AppTextStyle.title(color: AppClolors.white),
          );
        });
  }

  void _startDuration(Duration duration) {
    animationController.duration = duration;
    animationController.reverse(from: 1.0);
  }

  // Pause - dừng tại vị trí hiện tại
  void pause() {
    if (widget.isPlaying && animationController.isAnimating) {
      _pausedValue = animationController.value;
      animationController.stop();
    }
  }

  // Resume - tiếp tục từ vị trí đã pause
  void resume() {
    animationController.reverse(from: _pausedValue);
  }
}
