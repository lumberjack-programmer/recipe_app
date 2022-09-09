import 'package:objectbox/objectbox.dart';

@Entity()
class Recipe {
   int id;
   String name;
   int cookingTime;
   int difficulty;

  Recipe(
      {this.id = 0, required this.name, required this.cookingTime, required this.difficulty});

   final ingredients = ToMany<Ingredient>();

  @override
  String toString() {
    return 'Recipe{id: $id, name: $name, cookingTime: $cookingTime, difficulty: $difficulty}';
  }


}

@Entity()
class Ingredient {
   int id;
   String name;

  Ingredient({this.id = 0, required this.name});



  @override
  String toString() {
    return 'Recipe{id: $id, name: $name}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
