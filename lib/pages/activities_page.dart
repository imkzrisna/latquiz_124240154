// HALAMAN AKTIVITAS
// Dibuka dari tombol "Lihat Aktivitas" di AnimalDetailPage lewat Navigator.push.
// Menerima objek Animal dan menampilkan daftar aktivitasnya sebagai list.

import 'package:flutter/material.dart';
import '../models/animal.dart';

class ActivitiesPage extends StatelessWidget {
  final Animal animal;

  const ActivitiesPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tombol back otomatis karena dibuka dengan push.
      appBar: AppBar(title: Text('Aktivitas ${animal.name}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: animal.activities.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              // Lingkaran berisi nomor urut (index mulai 0, jadi +1).
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(animal.activities[index]),
              subtitle: Text('Aktivitas ke-${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
