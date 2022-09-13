

import 'package:recipe_app/model/ingredient_element.dart';
import 'package:recipe_app/objectbox/model.dart';

class RecipeAPI {
  final id;
  final title;
  final recipeCategory;
  final description;
  final imageUrl;
  final cookingTime;
  final preparationTime;
  final calories;
  final level;
  final rating;
  final List<IngredientElement> ingredients;
  bool favorite;

  RecipeAPI({required this.id, required this.title, required this.recipeCategory, required this.description, required this.imageUrl, required this.cookingTime,
  required this.preparationTime, this.calories, required this.level, required this.rating, required this.ingredients, required this.favorite});

  factory RecipeAPI.fromJson(Map<String, dynamic> json) {
    return RecipeAPI(
        id: json['id'],
        title: json['title'],
        recipeCategory: json['recipeCategory']['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        cookingTime: json['cookingTime'],
        preparationTime: json['preparationTime'],
        calories: json['calories'],
        level: json['level'],
        rating: json['rating'],
        ingredients: ((json['ingredients'] as List<dynamic>).map((ingredient) => IngredientElement.fromJson(ingredient)).toList()),
        favorite: false
    );
  }
}

