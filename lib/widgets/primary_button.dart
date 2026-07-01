import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.fullWidth = true,
    this.height = 54,
  });

  final String text;
<<<<<<< HEAD
  final VoidCallback? onPressed;
=======
  final VoidCallback onPressed;
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  final IconData? icon;
  final bool fullWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final isDisabled = onPressed == null;
    
=======
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    final child = Container(
      height: height,
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
<<<<<<< HEAD
        gradient: isDisabled
            ? LinearGradient(colors: [Colors.grey[400]!, Colors.grey[500]!])
            : AppColors.primaryGradient(),
        borderRadius: BorderRadius.circular(18),
        boxShadow: isDisabled
            ? []
            : [
                BoxShadow(
                  color: AppColors.teal.withValues(alpha: 0.28),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
=======
        gradient: AppColors.primaryGradient(),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.teal.withValues(alpha: 0.28),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
      ),
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
<<<<<<< HEAD
            Icon(icon, color: isDisabled ? Colors.grey[600] : Colors.white, size: 20),
=======
            Icon(icon, color: Colors.white, size: 20),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
            const SizedBox(width: 8),
          ],
          Text(
            text,
<<<<<<< HEAD
            style: TextStyle(
              color: isDisabled ? Colors.grey[600] : Colors.white,
=======
            style: const TextStyle(
              color: Colors.white,
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
<<<<<<< HEAD
        onTap: isDisabled ? null : onPressed,
=======
        onTap: onPressed,
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
        borderRadius: BorderRadius.circular(18),
        child: child,
      ),
    );
  }
}
