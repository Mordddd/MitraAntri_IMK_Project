import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.fullWidth = true,
    this.height = 54,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool fullWidth;
  final double height;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.onPressed == null;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    final child = AnimatedContainer(
      duration:
          reduceMotion ? Duration.zero : const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      height: widget.height,
      width: widget.fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: isDisabled ? AppColors.lightGrey : AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(
              widget.icon,
              color: isDisabled ? AppColors.subtext : Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isDisabled ? AppColors.subtext : Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

    return Semantics(
      button: true,
      enabled: !isDisabled,
      child: AnimatedScale(
        scale: _pressed && !reduceMotion ? 0.98 : 1,
        duration:
            reduceMotion ? Duration.zero : const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            onHighlightChanged:
                isDisabled ? null : (value) => setState(() => _pressed = value),
            borderRadius: BorderRadius.circular(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
