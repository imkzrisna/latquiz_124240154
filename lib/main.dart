// ============================================================
// ALUR APLIKASI (ringkasan untuk dijelaskan di kelas)
//
//   main() -> MyApp -> LoginPage
//                        |-- login benar -> pushReplacement -> HomePage
//                        |-- login salah -> SnackBar merah (tetap di Login)
//   HomePage (GridView.builder)
//        |-- klik kartu  -> Navigator.push -> AnimalDetailPage
//        |                     |-- tombol back (AppBar) -> pop -> HomePage
//        |-- ikon logout -> pushReplacement -> LoginPage
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/login_page.dart';

// Titik awal program. runApp() menjalankan widget paling atas (MyApp).
void main() {
  runApp(const MyApp());
}

// Widget root aplikasi. StatelessWidget karena tidak menyimpan state yang berubah.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp = pembungkus utama: tema, routing/navigator, halaman awal.
    return MaterialApp(
      title: 'Animals App',
      debugShowCheckedModeBanner: false, // hilangkan pita "DEBUG"
      // Tema global: semua halaman otomatis memakai warna/gaya ini,
      // jadi tidak perlu mengatur AppBar satu per satu.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDF7FF), // latar lavender muda
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white, // warna ikon & tombol back
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light, // ikon status bar putih
        ),
      ),
      // Halaman pertama yang tampil saat aplikasi dibuka.
      home: const LoginPage(),
    );
  }
}
