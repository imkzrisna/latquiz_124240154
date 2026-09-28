import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tombol back otomatis dari AppBar (Navigator.push -> pop)
      appBar: AppBar(title: Text(animal.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto
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

            // Info umum
            const Text(
              'Animal Details:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text('Type : ${animal.type}'),
            Text('Height : ${animal.height} cm'),
            Text('Weight : ${animal.weight} kg'),
            const SizedBox(height: 20),

            // Habitat
            const Text(
              'Animal Habitat',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _chips(animal.habitat),
            const SizedBox(height: 20),

            // Aktivitas
            const Text(
              'Animal Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _chips(animal.activities),
          ],
        ),
      ),
    );
  }

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
