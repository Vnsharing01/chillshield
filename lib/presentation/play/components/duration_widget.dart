import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/formats.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/material.dart';

class DurationWidget extends StatefulWidget {
  const DurationWidget({
    super.key,
    this.duration = Duration.zero,
    this.isPlaying = true,
  });
  final Duration duration;
  final bool isPlaying;

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
    animationController.addListener(
      () => widget.isPlaying ? setState(() {}) : animationController.stop,
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
    final duration = animationController.duration! * animationController.value;

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

  //  // Pause - dừng tại vị trí hiện tại
  // void pause() {
  //   if (!widget.isPlaying && _controller.isAnimating) {
  //     _pausedValue = _controller.value;
  //     _controller.stop();
  //     _isPaused = true;
  //   }
  // }

  // // Resume - tiếp tục từ vị trí đã pause
  // TickerFuture resume() {
  //   if (widget.isPlaying) {
      
      
  //     // Tính toán duration còn lại
  //     double remainingProgress = 1.0 - _pausedValue;
  //     Duration remainingDuration = _originalDuration * remainingProgress;
      
  //     // Cập nhật duration và tiếp tục
  //     _controller.duration = remainingDuration;
  //     return _controller.forward(from: _pausedValue);
  //   }
  //   return TickerFuture.complete();
  // }
}
