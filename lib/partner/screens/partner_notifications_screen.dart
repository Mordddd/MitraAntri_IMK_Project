import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../models/partner_notification.dart';
import '../partner_scope.dart';

class PartnerNotificationsScreen extends StatelessWidget {
  const PartnerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);
    final notifications = partner.notifications;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Notifikasi'),
        actions: [
          TextButton(
            onPressed: partner.markAllNotificationsRead,
            child: const Text('Tandai dibaca'),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(child: Text('Tidak ada notifikasi'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                final d = notif.timestamp;
                final timeStr =
                    '${d.day}/${d.month} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

                return Dismissible(
                  key: Key(notif.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => partner.markNotificationRead(notif.id),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(Icons.done_rounded, color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () => partner.markNotificationRead(notif.id),
                    borderRadius: BorderRadius.circular(24),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 520),
                      curve: Curves.easeOutQuart,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: notif.isRead
                            ? AppColors.card
                            : AppColors.primary.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: notif.isRead
                              ? Colors.white70
                              : AppColors.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: notif.type.color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              notif.type.icon,
                              color: notif.type.color,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notif.type.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: AppColors.navy,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  notif.message,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.subtext,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  timeStr,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: AppColors.subtext,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!notif.isRead)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
