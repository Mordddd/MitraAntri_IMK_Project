# Mitra Antri

Prototipe Flutter interaktif untuk alur pelanggan dan mitra antre.

## Menjalankan aplikasi

Pastikan Flutter stable sudah tersedia, lalu jalankan:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Pilih **Mulai sebagai Pengguna** untuk mencoba pemesanan, pelacakan, dan
pembayaran. Pada layar pelacakan, tombol **Perbarui Status Demo** memajukan
status pesanan lokal sampai pembayaran tersedia.

Pilih **Masuk sebagai Mitra** untuk mencoba dashboard, menerima, atau menolak
pesanan. Menu Akun mengembalikan aplikasi ke pemilihan peran.

## Struktur

- `lib/app`: state aplikasi, peran, dan siklus pesanan lokal.
- `lib/screens`: layar pelanggan dan mitra.
- `lib/models`: model domain sederhana.
- `lib/widgets`: komponen visual bersama.

Data saat ini tersimpan di memori untuk keperluan demo. API, autentikasi,
real-time tracking, chat, dan payment gateway harus dihubungkan melalui lapisan
repository sebelum aplikasi dipakai di produksi.
