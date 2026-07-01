import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/snackbar_helper.dart';
import '../partner_scope.dart';

class PartnerSettingsScreen extends StatelessWidget {
  const PartnerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _SettingsCard(
            children: [
              SwitchListTile(
                title: const Text(
                  'Notifikasi',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: const Text('Terima notifikasi pesanan baru'),
                value: partner.notificationsEnabled,
                activeThumbColor: AppColors.primary,
                onChanged: partner.setNotificationsEnabled,
              ),
              const Divider(height: 1),
              const SwitchListTile(
                title: Text(
                  'Tema aplikasi',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text('Tema warm cream aktif'),
                value: false,
                activeThumbColor: AppColors.primary,
                onChanged: null,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const _SettingsCard(
            children: [
              ListTile(
                leading: Icon(Icons.language_rounded),
                title: Text(
                  'Bahasa',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text('Pilihan bahasa lain segera hadir'),
                trailing: Text(
                  'Indonesia',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SettingsCard(
            children: [
              _LinkTile(
                icon: Icons.help_center_rounded,
                label: 'Pusat Bantuan',
                onTap: () => SnackbarHelper.show(
                  context,
                  'Pusat bantuan belum tersedia.',
                ),
              ),
              const Divider(height: 1),
              _LinkTile(
                icon: Icons.privacy_tip_rounded,
                label: 'Kebijakan Privasi',
                onTap: () => SnackbarHelper.show(
                  context,
                  'Kebijakan privasi belum tersedia.',
                ),
              ),
              const Divider(height: 1),
              _LinkTile(
                icon: Icons.info_outline_rounded,
                label: 'Tentang',
                onTap: () => SnackbarHelper.show(
                  context,
                  'MitraAntri Driver v1.0.0',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white70),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(children: children),
    );
  }
}

class _LinkTile extends StatelessWidget {
  const _LinkTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.navy),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
