class IngredientElement {
  final String name;
  final double measurement;
  final String unit;

  IngredientElement({ required this.name, required this.measurement, required this.unit});

  factory IngredientElement.fromJson(Map<String, dynamic> json) {
    return IngredientElement(
        name: json['name'],
        measurement: json['measurement']['measurement'],
        unit: json['measurement']['unit'],
    );
  }
}