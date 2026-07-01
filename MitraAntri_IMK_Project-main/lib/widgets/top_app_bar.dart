import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class TopAppBar extends PreferredSize {
  TopAppBar({
    required String title,
    bool showBack = true,
    List<Widget>? actions,
  }) : super(
    preferredSize: const Size.fromHeight(64),
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
      padding: const EdgeInsets.fromLTRB(20, 10, 12, 8),
      child: Row(
        children: [
          if (showBack)
            _IconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.maybePop(context),
            )
          else
            const SizedBox(width: 44),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
          if (actions != null && actions!.isNotEmpty)
            Row(children: actions!)
          else
            const SizedBox(width: 44),
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.border)),
          child: Icon(icon, size: 18, color: AppColors.navy),
        ),
      ),
    );
  }
}
