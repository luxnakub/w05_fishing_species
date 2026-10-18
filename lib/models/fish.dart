class Fish {
  final int id;
  final String name;
  final String scientificName;
  final String habitat;
  final double avgWeightKg;
  final String difficulty;
  final String description;
  final List<String> imagePaths; // รองรับหลายภาพตามโจทย์ W05

  const Fish({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.habitat,
    required this.avgWeightKg,
    required this.difficulty,
    required this.description,
    required this.imagePaths,
  });
}