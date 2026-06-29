import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key, required this.title, this.actionText, this.onAction});

  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.teal,
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(actionText!,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
          ),
      ],
    );
  }
}
