// MODEL HEWAN
// Cetakan data satu hewan. Field diturunkan dari data dummy di SPADA:
//  - weight  double       -> ada nilai desimal (220.5, 0.4)
//  - height  int          -> bilangan bulat (110, 70)
//  - habitat & activities -> List<String> karena bisa lebih dari satu nilai
//  - final                -> nilai tidak bisa diubah setelah objek dibuat

class Animal {
  final String name;
  final String type;
  final double weight;
  final int height;
  final List<String> habitat;
  final List<String> activities;
  final String image; // URL gambar (dimuat lewat Image.network)

  Animal({
    required this.name,
    required this.type,
    required this.weight,
    required this.height,
    required this.habitat,
    required this.activities,
    required this.image,
  });
}
