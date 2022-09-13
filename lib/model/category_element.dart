



class CategoryElement {
  final int id;
  final String name;

  CategoryElement({required this.id, required this.name});

  factory CategoryElement.fromJson(Map<String, dynamic> json) {
    return CategoryElement(
        id: json['id'],
        name: json['name']
    );
  }
}