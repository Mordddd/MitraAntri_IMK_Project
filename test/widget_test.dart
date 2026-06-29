import 'package:flutter_test/flutter_test.dart';
import 'package:mitra_antri_mockup/main.dart';

void main() {
  testWidgets('customer can enter the customer home flow', (tester) async {
    await tester.pumpWidget(const MitraAntriApp());

    expect(find.text('Mulai sebagai Pengguna'), findsOneWidget);
    expect(find.text('Masuk sebagai Mitra'), findsOneWidget);

    await tester.ensureVisible(find.text('Mulai sebagai Pengguna'));
    await tester.tap(find.text('Mulai sebagai Pengguna'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Halo, Ardi!'), findsOneWidget);
    expect(find.text('Pesan Mitra'), findsOneWidget);
  });

  testWidgets('partner entry opens only the partner dashboard', (tester) async {
    await tester.pumpWidget(const MitraAntriApp());

    await tester.ensureVisible(find.text('Masuk sebagai Mitra'));
    await tester.tap(find.text('Masuk sebagai Mitra'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Hai, Budi!'), findsOneWidget);
    expect(find.text('Permintaan Masuk'), findsOneWidget);
    expect(find.text('Pesan Mitra'), findsNothing);
  });
}
