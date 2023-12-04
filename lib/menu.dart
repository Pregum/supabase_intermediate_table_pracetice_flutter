class Menu {
  late final int id;
  late final String name;
  late final DateTime createdAt;

  Menu({required this.id, required this.name, required this.createdAt});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? 0;
    createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();
  }
}
