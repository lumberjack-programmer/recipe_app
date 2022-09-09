
class RecipeElement {
  final List<dynamic> recipes;


  RecipeElement({required this.recipes});

  factory RecipeElement.fromJson(Map<String, dynamic> json) {
    return RecipeElement(
        recipes: json['_embedded']['recipes'],
    );
  }
}