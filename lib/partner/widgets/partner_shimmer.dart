import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class PartnerShimmer extends StatefulWidget {
  const PartnerShimmer({
    super.key,
    required this.child,
    this.isLoading = true,
  });

  final Widget child;
  final bool isLoading;

  @override
  State<PartnerShimmer> createState() => _PartnerShimmerState();
}

class _PartnerShimmerState extends State<PartnerShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Column(
          children: [
            _ShimmerBox(
              animation: _controller,
              height: 180,
              radius: 28,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _ShimmerBox(
                    animation: _controller,
                    height: 90,
                    radius: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ShimmerBox(
                    animation: _controller,
                    height: 90,
                    radius: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShimmerBox(
              animation: _controller,
              height: 120,
              radius: 24,
            ),
            const SizedBox(height: 12),
            _ShimmerBox(
              animation: _controller,
              height: 160,
              radius: 24,
            ),
          ],
        );
      },
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.animation,
    required this.height,
    required this.radius,
  });

  final Animation<double> animation;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment(-1 + animation.value * 2, 0),
          end: Alignment(animation.value * 2, 0),
          colors: const [
            Color(0xFFE8EEF7),
            Color(0xFFF8FAFC),
            Color(0xFFE8EEF7),
          ],
        ),
      ),
    );
  }
}

class PartnerEmptyState extends StatelessWidget {
  const PartnerEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: AppColors.subtext),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.subtext,
                height: 1.4,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onAction,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
