import 'package:flutter/material.dart';

class FadeSlideIn extends StatelessWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = 16,
  });

  final Widget child;
  final Duration delay;
  final double offset;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) return child;

    final totalMilliseconds = 420 + delay.inMilliseconds;
    final start = delay.inMilliseconds / totalMilliseconds;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: totalMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final progress = value <= start
            ? 0.0
            : ((value - start) / (1 - start)).clamp(0.0, 1.0);
        return Opacity(
          opacity: progress,
          child: Transform.translate(
            offset: Offset(0, offset * (1 - progress)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
