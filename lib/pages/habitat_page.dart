// HALAMAN HABITAT
// Dibuka dari tombol di AnimalDetailPage lewat Navigator.push.
// Menerima objek Animal dan menampilkan daftar habitatnya sebagai list.

import 'package:flutter/material.dart';
import '../models/animal.dart';

class HabitatPage extends StatelessWidget {
  final Animal animal;

  const HabitatPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tombol back otomatis karena dibuka dengan push.
      appBar: AppBar(title: Text('Habitat ${animal.name}')),
      // ListView.builder: satu ListTile per habitat.
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: animal.habitat.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.terrain),
              title: Text(animal.habitat[index]),
              subtitle: Text('Habitat ke-${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
