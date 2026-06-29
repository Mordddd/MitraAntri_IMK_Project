import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class QueueHeroIllustration extends StatelessWidget {
  const QueueHeroIllustration({super.key, this.height = 230});

  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEAF7FF), Color(0xFFDFF7EF)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 28,
              top: 58,
              child: _TicketBadge(label: 'A-023'),
            ),
            const Positioned(
                left: 48,
                bottom: 36,
                child: _TinyPerson(
                    color: AppColors.blue, shirt: Color(0xFF4BB3FD))),
            const Positioned(
                left: 95,
                bottom: 36,
                child: _TinyPerson(
                    color: AppColors.teal, shirt: Color(0xFF22C7A9))),
            const Positioned(
                left: 142,
                bottom: 36,
                child: _TinyPerson(
                    color: AppColors.warning, shirt: Color(0xFFF6C344))),
            Positioned(
              right: 30,
              bottom: 24,
              child: Container(
                width: 116,
                height: 108,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient(),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.teal.withValues(alpha: .18),
                        blurRadius: 20,
                        offset: const Offset(0, 12))
                  ],
                ),
                child: const Icon(Icons.support_agent_rounded,
                    color: Colors.white, size: 56),
              ),
            ),
            Positioned(
              left: 18,
              right: 18,
              bottom: 0,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.navy.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            Positioned(
              top: 25,
              right: 100,
              child: Icon(Icons.location_on_rounded,
                  color: AppColors.teal.withValues(alpha: .25), size: 34),
            ),
            Positioned(
              top: 34,
              left: 138,
              child: Icon(Icons.schedule_rounded,
                  color: AppColors.blue.withValues(alpha: .22), size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallBuilding extends StatelessWidget {
  const SmallBuilding({super.key, this.width = 72, this.height = 58});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
            colors: [Color(0xFFBFE5FF), Color(0xFFE8FAF5)]),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 8,
            child: Container(
              width: width * .58,
              height: height * .64,
              decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .85),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            bottom: 8,
            child: Column(
              children: List.generate(3, (row) {
                return Row(
                  children: List.generate(3, (col) {
                    return Container(
                      margin: const EdgeInsets.all(2),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                          color: AppColors.blue.withValues(alpha: .35),
                          borderRadius: BorderRadius.circular(2)),
                    );
                  }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class MitraAvatar extends StatelessWidget {
  const MitraAvatar({super.key, this.size = 52});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFFFD6A3), Color(0xFFE8A46E)]),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
              color: AppColors.navy.withValues(alpha: .10),
              blurRadius: 12,
              offset: const Offset(0, 6))
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size * .20,
            child: Container(
              width: size * .38,
              height: size * .20,
              decoration: const BoxDecoration(
                  color: Color(0xFF201D2E),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(99))),
            ),
          ),
          Positioned(
            top: size * .32,
            child: Container(
              width: size * .36,
              height: size * .34,
              decoration: BoxDecoration(
                  color: const Color(0xFFF7C58F),
                  borderRadius: BorderRadius.circular(99)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size * .62,
              height: size * .28,
              decoration: const BoxDecoration(
                  color: AppColors.teal,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(99))),
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketBadge extends StatelessWidget {
  const _TicketBadge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: AppColors.navy.withValues(alpha: .18),
              blurRadius: 16,
              offset: const Offset(0, 10))
        ],
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
    );
  }
}

class _TinyPerson extends StatelessWidget {
  const _TinyPerson({required this.color, required this.shirt});
  final Color color;
  final Color shirt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 70,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              width: 21,
              height: 21,
              decoration: BoxDecoration(
                  color: AppColors.navy.withValues(alpha: .95),
                  shape: BoxShape.circle)),
          Positioned(
            top: 31,
            child: Container(
              width: 24,
              height: 39,
              decoration: BoxDecoration(
                  color: shirt,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(18))),
            ),
          ),
        ],
      ),
    );
  }
}
