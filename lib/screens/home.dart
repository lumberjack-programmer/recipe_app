import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/model/recipe_element.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/recipe_service.dart';
import '../components/vertical_scroll_text.dart';
import '../components/recipe_card.dart';
import '../objectbox/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Category {
  popular, mainDishes, breakfast, dinner, launch
}

class _HomeScreenState extends State<HomeScreen> {

   late Category currentCategory = Category.popular;
   List<RecipeAPI> recipeList = [];

   @override
  void initState() {
    super.initState();
    getRecipesList();
  }

  Future<void> addRecipe() async {
     Ingredient ingredient = Ingredient(name: 'avocado');
     Ingredient ingredient2 = Ingredient(name: 'tomato');
     Ingredient ingredient3 = Ingredient(name: 'onion');
     // Recipe recipe = Recipe(name: 'Test', cookingTime: 180, difficulty: 2);
     Recipe recipeRetrieved = objectBox.recipeBox.get(24)!;
     recipeRetrieved.ingredients.addAll([ingredient, ingredient2, ingredient3]);
     objectBox.recipeBox.put(recipeRetrieved);
   }

   Future<void> getRecipesList() async {
     RecipeService recipeService = RecipeService();
     var data = await recipeService.fetchRecipes();
     var test = RecipeElement.fromJson(jsonDecode(data.body));
     recipeList = test.recipes.map((recipe) => RecipeAPI.fromJson(recipe)).toList();
   }


   Future<void> getRecipes() async {
     Ingredient ingredient = Ingredient(name: 'avocado');
     Ingredient ingredient2 = Ingredient(name: 'tomato');
     Ingredient ingredient3 = Ingredient(name: 'onion');
     // Recipe recipe = Recipe(name: 'Test', cookingTime: 180, difficulty: 2);
     Recipe recipeRetrieved = objectBox.recipeBox.get(24)!;
     recipeRetrieved.ingredients.addAll([ingredient, ingredient2, ingredient3]);
     objectBox.recipeBox.put(recipeRetrieved);
     // recipe.ingredients.add(ingredient);
     // recipe.ingredients.add(ingredient2);
     // recipe.ingredients.add(ingredient3);

     // Recipe recipe2 = Recipe(name: 'Recipe2', cookingTime: 160, difficulty: 4);
     // recipe2.ingredients.add(ingredient3);
     //
     // objectBox.recipeBox.putMany([recipe, recipe2]);



   }

   // static void removeAllData() async {
   //   Directory dir = await getApplicationDocumentsDirectory();
   //   Directory(dir.path + '/your_db').delete().then((FileSystemEntity value) => print("DB Deleted: ${value.existsSync()}"));
   // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMostlyBlack,
        leading: Icon(Icons.menu, color: kVividOrange,),
        actions: [
              // Icon(Icons.favorite, color: kVividOrange,),
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/lumberjack.jpg'),
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Find the same recipe for yourself',
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 40.0,),
              child: TextFormField(
                  decoration: kInputDecoration,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.popular;
                      });
                    },
                    text: 'Popular',
                    color: currentCategory == Category.popular ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.mainDishes;
                      });
                    },
                    text: 'Main dishes',
                  color: currentCategory == Category.mainDishes ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.breakfast;
                      });
                    },
                    text: 'Breakfast',
                    color: currentCategory == Category.breakfast ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.dinner;
                      });
                    },
                    text: 'Dinner',
                    color: currentCategory == Category.dinner ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.launch;
                      });
                    },
                    text: 'Launch',
                    color: currentCategory == Category.launch ? Colors.white : kDarkGray,),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        RecipeCard(
                          onTap: () {

                          },
                          favoriteIcon: Icons.favorite,
                          imageAsset: recipeList[0].imageUrl,
                          recipeName: recipeList[0].title,
                          cookingTime: '15 min',
                          starIcon: Icons.star,
                          rating: '4.7',
                        ),
                        SizedBox(width: 20.0,),
                        RecipeCard(
                          onTap: () {

                          },
                          favoriteIcon: Icons.favorite_border,
                          imageAsset: recipeList[1].imageUrl,
                          recipeName: 'Grilled salmon with avocado',
                          cookingTime: '15 min',
                          starIcon: Icons.star_border,
                          rating: '5.0',
                        ),
                      ],
                    ),


                    FlatButton(onPressed: () {
                      addRecipe();
                    }, child: Text('Add recipe'),
                    ),


        for (var element in objectBox.recipeBox.get(24)!.ingredients)
          Text(element.name),

                // Text('${objectBox.recipeBox.get(24)!.ingredients.length}'),
                  // Text('${objectBox.recipeBox.count()}'),
                  // Text('${objectBox.recipeBox.getAll()}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




