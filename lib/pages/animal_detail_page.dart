// HALAMAN DETAIL HEWAN
// Menerima SATU objek Animal lewat constructor (dikirim dari HomePage),
// lalu menampilkan seluruh datanya.
// Fitur interaktif:
//  - Ikon favorit di AppBar (berubah dengan setState)
//  - Tombol "Lihat Habitat" yang membuka HabitatPage

import 'package:flutter/material.dart';
import '../models/animal.dart';
import 'habitat_page.dart';
import 'activities_page.dart';

// Sekarang StatefulWidget karena ada data yang BERUBAH (status favorit).
class AnimalDetailPage extends StatefulWidget {
  final Animal animal; // data yang diterima dari Home

  const AnimalDetailPage({super.key, required this.animal});

  @override
  State<AnimalDetailPage> createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  // STATE: true = sudah difavoritkan. Awalnya false.
  bool isFavorite = false;

  // Dipanggil saat ikon favorit ditekan.
  void _toggleFavorite() {
    // setState memberi tahu Flutter: "data berubah, gambar ulang layar".
    setState(() {
      isFavorite = !isFavorite; // balik nilainya: false <-> true
    });

    // Tampilkan pesan singkat di bawah layar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? '${widget.animal.name} ditambahkan ke favorit'
              : '${widget.animal.name} dihapus dari favorit',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Di State class, data dari widget diakses lewat "widget.animal".
    final animal = widget.animal;

    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        actions: [
          IconButton(
            // Ikon & warna bergantung pada nilai isFavorite.
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            tooltip: 'Favorit',
            onPressed: _toggleFavorite,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOTO
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                animal.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stack) => const Center(
                  child: Icon(Icons.broken_image, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // INFO UMUM
            const Text(
              'Animal Details:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text('Type : ${animal.type}'),
            Text('Height : ${animal.height} cm'),
            Text('Weight : ${animal.weight} kg'),
            const SizedBox(height: 20),

            // HABITAT
            const Text(
              'Animal Habitat',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _chips(animal.habitat),
            const SizedBox(height: 20),

            // AKTIVITAS
            const Text(
              'Animal Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _chips(animal.activities),
            const SizedBox(height: 24),

            // TOMBOL KE HALAMAN LAIN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.terrain),
                label: const Text('Lihat Habitat'),
                onPressed: () {
                  // push = HabitatPage ditumpuk di atas Detail (bisa back).
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HabitatPage(animal: animal),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.directions_run),
                label: const Text('Lihat Aktivitas'),
                onPressed: () {
                  // push = ActivitiesPage ditumpuk di atas Detail (bisa back).
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivitiesPage(animal: animal),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: mengubah List<String> menjadi deretan chip.
  Widget _chips(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .map(
            (item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(item, style: const TextStyle(fontSize: 13)),
            ),
          )
          .toList(),
    );
  }
}
