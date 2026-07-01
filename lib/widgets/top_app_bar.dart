import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class TopAppBar extends PreferredSize {
  TopAppBar({
    super.key,
    required String title,
    bool showBack = true,
    List<Widget>? actions,
  }) : super(
          preferredSize: const Size.fromHeight(72),
          child: _TopAppBarContent(
            title: title,
            showBack: showBack,
            actions: actions,
          ),
        );
}

class _TopAppBarContent extends StatelessWidget {
  const _TopAppBarContent({
    required this.title,
    required this.showBack,
    this.actions,
  });

  final String title;
  final bool showBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
      child: Row(
        children: [
          if (showBack)
            _IconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.maybePop(context),
            )
          else
            const SizedBox.shrink(),
          if (showBack) const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.35,
                  fontSize: 18),
            ),
          ),
          if (actions != null && actions!.isNotEmpty)
            Row(children: actions!)
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.shell,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withValues(alpha: .7))),
          child: Icon(icon, size: 18, color: AppColors.navy),
        ),
      ),
    );
  }
}
