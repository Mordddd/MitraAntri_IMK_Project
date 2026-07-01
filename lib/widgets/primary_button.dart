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
      curve: Curves.easeOutQuart,
      height: widget.height,
      width: widget.fullWidth ? double.infinity : null,
      padding: const EdgeInsets.fromLTRB(22, 0, 8, 0),
      decoration: BoxDecoration(
        color: isDisabled ? AppColors.lightGrey : AppColors.primary,
        borderRadius: BorderRadius.circular(widget.height / 2),
      ),
      child: Row(
        mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.text,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDisabled ? AppColors.subtext : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            width: widget.height - 16,
            height: widget.height - 16,
            decoration: BoxDecoration(
              color: isDisabled
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: .14),
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon ?? Icons.arrow_forward_rounded,
              color: isDisabled ? AppColors.subtext : Colors.white,
              size: 19,
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
        curve: Curves.easeOutQuart,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            onHighlightChanged:
                isDisabled ? null : (value) => setState(() => _pressed = value),
            borderRadius: BorderRadius.circular(widget.height / 2),
            child: child,
          ),
        ),
      ),
    );
  }
}
