import 'package:flutter/material.dart';
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../data/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/form_tile.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_header.dart';
import '../widgets/top_app_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _service = DummyData.order.service;
  String _date = DummyData.order.date;
  String _time = DummyData.order.time;
  final _notesController = TextEditingController(
    text:
        'Mohon ambil nomor antrean pagi dan kabari lewat chat jika loket berubah.',
  );

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = AppScope.watch(context).order;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const TopAppBar(title: 'Pesan Mitra'),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCard(
                        padding: const EdgeInsets.all(18),
                        radius: 28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.primaryGradient(),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.edit_calendar_rounded,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Detail Pemesanan',
                                          style: TextStyle(
                                              color: AppColors.navy,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18)),
                                      SizedBox(height: 4),
                                      Text(
                                          'Isi kebutuhan antreanmu dengan jelas.',
                                          style: TextStyle(
                                              color: AppColors.subtext,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            FormTile(
                              label: 'Lokasi',
                              value: order.location,
                              subtitle: order.address,
                              icon: Icons.location_on_rounded,
                            ),
                            const SizedBox(height: 12),
                            FormTile(
                              label: 'Jenis Layanan',
                              value: _service,
                              icon: Icons.medical_services_rounded,
                              onTap: _pickService,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                    child: FormTile(
                                        label: 'Tanggal',
                                        value: _date,
                                        icon: Icons.calendar_month_rounded,
                                        onTap: _pickDate)),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: FormTile(
                                        label: 'Jam',
                                        value: _time,
                                        icon: Icons.schedule_rounded,
                                        onTap: _pickTime)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.notes_rounded,
                                          color: AppColors.teal, size: 19),
                                      SizedBox(width: 8),
                                      Text('Catatan Opsional',
                                          style: TextStyle(
                                              color: AppColors.subtext,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  const SizedBox(height: 9),
                                  TextField(
                                    controller: _notesController,
                                    maxLength: 150,
                                    minLines: 2,
                                    maxLines: 4,
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Tambahkan instruksi untuk mitra',
                                      counterText: '',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      filled: false,
                                    ),
                                    style: const TextStyle(
                                        color: AppColors.navy,
                                        fontSize: 13.2,
                                        fontWeight: FontWeight.w700,
                                        height: 1.35),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      const SectionHeader(title: 'Estimasi Budget'),
                      const SizedBox(height: 12),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: AppColors.mint,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(Icons.payments_rounded,
                                  color: AppColors.teal),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rp 80.000 – Rp 120.000',
                                      style: TextStyle(
                                          color: AppColors.navy,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16)),
                                  SizedBox(height: 3),
                                  Text(
                                      'Anggaran fleksibel sesuai kondisi antrean.',
                                      style: TextStyle(
                                          color: AppColors.subtext,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppCard(
                        color: AppColors.sky,
                        borderColor: AppColors.blue.withValues(alpha: .12),
                        padding: const EdgeInsets.all(14),
                        child: const Row(
                          children: [
                            Icon(Icons.lightbulb_rounded,
                                color: AppColors.blue),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Tips: tulis patokan lokasi dan instruksi khusus supaya mitra tidak salah antre.',
                                style: TextStyle(
                                    color: AppColors.navy,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Cari Mitra Terdekat',
                        icon: Icons.search_rounded,
                        onPressed: () {
                          AppScope.read(context).submitBooking(
                            service: _service,
                            date: _date,
                            time: _time,
                            notes: _notesController.text.trim(),
                          );
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.tracking);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickService() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: DummyData.categories
              .map(
                (category) => ListTile(
                  leading: Icon(category.icon, color: category.color),
                  title: Text(category.title),
                  subtitle: Text(category.subtitle),
                  onTap: () => Navigator.pop(context, category.title),
                ),
              )
              .toList(),
        ),
      ),
    );
    if (selected != null) setState(() => _service = selected);
  }

  Future<void> _pickDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selected == null || !mounted) return;
    setState(() =>
        _date = MaterialLocalizations.of(context).formatMediumDate(selected));
  }

  Future<void> _pickTime() async {
    final selected = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (selected == null || !mounted) return;
    setState(() => _time = selected.format(context));
  }
}
