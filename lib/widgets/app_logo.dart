import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.compact = false, this.center = true});

  final bool compact;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final markSize = compact ? 38.0 : 52.0;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: markSize,
          height: markSize,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(compact ? 12 : 16),
          ),
          child: Icon(
            Icons.groups_rounded,
            color: Colors.white,
            size: compact ? 22 : 29,
          ),
        ),
        SizedBox(width: compact ? 10 : 13),
        Text(
          'MitraAntri',
          style: TextStyle(
            color: AppColors.navy,
            fontSize: compact ? 20 : 27,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.8,
          ),
        ),
      ],
    );

    return Align(
      alignment: center ? Alignment.center : Alignment.centerLeft,
      child: content,
    );
  }
}
