import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animal.name)),
      body: Center(child: Text('Detail ${animal.name}')),
    );
  }
}
