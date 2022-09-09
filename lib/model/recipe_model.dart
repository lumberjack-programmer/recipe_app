

import 'package:recipe_app/objectbox/model.dart';

class RecipeAPI {
  final id;
  final title;
  final description;
  final imageUrl;
  final cookingTime;
  final preparationTime;
  final calories;
  final level;
  final rating;
  final ingredientsUrl;

  RecipeAPI({required this.id, required this.title, required this.description, required this.imageUrl, required this.cookingTime,
  required this.preparationTime, this.calories, required this.level, required this.rating, required this.ingredientsUrl});

  factory RecipeAPI.fromJson(Map<String, dynamic> json) {
    return RecipeAPI(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        cookingTime: json['cookingTime'],
        preparationTime: json['preparationTime'],
        level: json['level'],
        rating: json['rating'],
        ingredientsUrl: json['_links']['ingredients']['href']
    );
  }

}



// id: id,
// title: json['_embedded']['recipes'][id]['title'],
// description: json['_embedded']['recipes'][id]['description'],
// imageUrl: json['_embedded']['recipes'][id]['imageUrl'],
// cookingTime: json['_embedded']['recipes'][id]['cookingTime'],
// preparationTime: json['_embedded']['recipes'][id]['preparationTime'],
// level: json['_embedded']['recipes'][id]['level'],
// rating: json['_embedded']['recipes'][id]['rating'],
// ingredientsUrl: json['_embedded']['recipes'][id]['_links']['ingredients']['href']);