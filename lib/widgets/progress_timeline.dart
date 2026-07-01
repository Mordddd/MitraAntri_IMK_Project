import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ProgressTimeline extends StatelessWidget {
  const ProgressTimeline(
      {super.key, required this.steps, required this.currentIndex});

  final List<String> steps;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(steps.length, (index) {
            final active = index <= currentIndex;
            final isLast = index == steps.length - 1;
            return Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      if (index != 0)
                        Expanded(
                            child: Container(
                                height: 3,
                                color: active
                                    ? AppColors.teal
                                    : AppColors.border)),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 520),
                        curve: Curves.easeOutQuart,
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: active ? AppColors.teal : AppColors.card,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: active ? AppColors.teal : AppColors.border,
                              width: 2),
                        ),
                        child: active
                            ? const Icon(Icons.check_rounded,
                                color: Colors.white, size: 15)
                            : null,
                      ),
                      if (!isLast)
                        Expanded(
                            child: Container(
                                height: 3,
                                color: index < currentIndex
                                    ? AppColors.teal
                                    : AppColors.border)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: active ? AppColors.tealDark : AppColors.subtext,
                      fontSize: 10,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
