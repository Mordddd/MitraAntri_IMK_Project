import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.color = AppColors.card,
    this.radius = 24,
    this.onTap,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final double radius;
  final VoidCallback? onTap;
  final Color? borderColor;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final content = AnimatedContainer(
      duration:
          reduceMotion ? Duration.zero : const Duration(milliseconds: 420),
      curve: Curves.easeOutQuart,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(
          color: widget.borderColor ?? Colors.white.withValues(alpha: .7),
        ),
        boxShadow: widget.color == AppColors.card ? AppColors.cardShadow : null,
      ),
      child: widget.child,
    );

    if (widget.onTap == null) return content;
    return AnimatedScale(
      scale: _pressed && !reduceMotion ? 0.975 : 1,
      duration:
          reduceMotion ? Duration.zero : const Duration(milliseconds: 180),
      curve: Curves.easeOutQuart,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: (value) => setState(() => _pressed = value),
          borderRadius: BorderRadius.circular(widget.radius),
          child: content,
        ),
      ),
    );
  }
}
