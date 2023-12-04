class Allergen {
  final int id;
  final String typeName;
  final DateTime createdAt;

  Allergen({required this.id, required this.typeName, required this.createdAt});

  Allergen.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        typeName = json['type_name'] ?? '',
        createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();
}
