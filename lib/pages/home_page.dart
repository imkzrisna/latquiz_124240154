// HALAMAN HOME
// Menampilkan semua hewan dalam bentuk grid.
// Data diambil dari dummyAnimals, tiap item digambar oleh AnimalCard.
//
// Alur:
//  - klik kartu   -> Navigator.push ke AnimalDetailPage (dikirim objek animal)
//  - klik logout  -> Navigator.pushReplacement ke LoginPage

import 'package:flutter/material.dart';

import '../data/animals_data.dart'; // sumber data (list dummyAnimals)
import '../widgets/animal_card.dart'; // tampilan satu kartu
import 'animal_detail_page.dart';
import 'login_page.dart';

// StatelessWidget: isi halaman tetap, tidak ada state yang berubah.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gaya AppBar (hitam, judul putih) diatur di tema main.dart.
      appBar: AppBar(
        title: const Text('Animals List'),
        actions: [
          // actions = widget di sisi kanan AppBar.
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
            onPressed: () {
              // Logout: ganti Home dengan Login.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      // GridView.builder membuat item hanya saat dibutuhkan (hemat memori).
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        // Aturan grid: lebar tiap kolom maksimal 220 -> jumlah kolom otomatis
        // menyesuaikan lebar layar. mainAxisExtent = tinggi kartu tetap,
        // supaya tidak terjadi overflow (garis kuning-hitam).
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 270,
        ),
        itemCount: dummyAnimals.length, // jumlah item = jumlah data
        // itemBuilder dipanggil sekali per item; index = urutan item (0,1,2,...).
        itemBuilder: (context, index) {
          final animal = dummyAnimals[index]; // ambil data hewan ke-index
          return AnimalCard(
            animal: animal,
            onTap: () {
              // push = halaman detail DITUMPUK di atas Home,
              // sehingga tombol back bisa kembali ke Home.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalDetailPage(animal: animal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
