import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitra_antri_mockup/main.dart';
import 'package:mitra_antri_mockup/core/app_theme.dart';
import 'package:mitra_antri_mockup/screens/event_ticket_screen.dart';

void main() {
  Future<void> reachLogin(WidgetTester tester) async {
    await tester.pumpWidget(const MitraAntriApp());
    expect(find.text('MitraAntri'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  }

  testWidgets('customer can enter the customer home flow', (tester) async {
    await reachLogin(tester);

    expect(find.text('Selamat datang kembali'), findsOneWidget);
    expect(find.text('Masuk sebagai Mitra'), findsOneWidget);

    await tester.ensureVisible(find.text('Masuk dengan Google'));
    await tester.tap(find.text('Masuk dengan Google'));
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.textContaining('Halo, Ardi'), findsOneWidget);
    expect(find.text('Pesan Mitra Sekarang'), findsOneWidget);
  });

  testWidgets('partner can enter the partner dashboard', (tester) async {
    await reachLogin(tester);

    await tester.ensureVisible(find.text('Masuk sebagai Mitra'));
    await tester.tap(find.text('Masuk sebagai Mitra'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(EditableText).first, 'mitra');
    await tester.enterText(find.byType(EditableText).last, '123456');
    await tester.ensureVisible(find.text('Login'));
    await tester.tap(find.text('Login'));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard Mitra'), findsOneWidget);
    expect(find.text('Permintaan Masuk'), findsOneWidget);
    expect(find.text('Pesan Mitra Sekarang'), findsNothing);
  });

  testWidgets('event catalog renders bundled artwork', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const EventTicketScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('We The Fest'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });
}
