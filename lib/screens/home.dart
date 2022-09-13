import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/model/category_element.dart';
import 'package:recipe_app/model/recipe_element.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/category_service.dart';
import 'package:recipe_app/service/recipe_service.dart';
import '../components/vertical_scroll_text.dart';
import '../components/recipe_card.dart';
import '../objectbox/model.dart';
import '../model/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Category {
  popular, mainDishes, breakfast, dinner, launch
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   late Category currentCategory = Category.popular;
   List<RecipeAPI> recipeList = [];
   List<CategoryElement> categoryList = [];

   @override
  void initState() {
    super.initState();
    getRecipesList();
    getCategoriesList();
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


     print(recipeList[0].recipeCategory);
   }


  Future<void> getCategoriesList() async {
    CategoryService categoryService = CategoryService();
    var data = await categoryService.fetchCategories();
    var test = CategoryApi.fromJson(jsonDecode(data.body));

    categoryList = test.data.map((category) => CategoryElement.fromJson(category)).toList();

     print(categoryList[0].name);
     print(categoryList[0].id);
  }

  List<RecipeAPI> recipeListByCategory = [];


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
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor:  kVeryDarkGray,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 112.0,
              child: DrawerHeader(
                // padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: kVeryDarkGray,
                ),
                child: Column(
                  children: [
                    Text('Menu'),
                    Divider(color: kDarkGray,),
                  ],
                ),

              ),
            ),
            for(int i = 0; i < categoryList.length; i++)
            ListTile(
              title: Text(categoryList[i].name),
              onTap: () {
                setState(() {
                  populateRecipeListByCategory(categoryList[i].name);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kMostlyBlack,
        leading: IconButton(
          icon: Icon(Icons.menu, color: kVividOrange,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
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
                        populateRecipeListByCategory("Popular");
                      });
                    },
                    text: 'Popular',
                    color: currentCategory == Category.popular ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.mainDishes;
                        populateRecipeListByCategory("main dishes");

                      });
                    },

                    text: 'Main dishes',
                  color: currentCategory == Category.mainDishes ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.breakfast;
                        populateRecipeListByCategory("breakfast");
                      });
                    },
                    text: 'Breakfast',
                    color: currentCategory == Category.breakfast ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.dinner;
                        populateRecipeListByCategory("dinner");
                        });
                    },
                    text: 'Dinner',
                    color: currentCategory == Category.dinner ? Colors.white : kDarkGray,),
                  VerticalScrollText(
                    onTap: () {
                      setState(() {
                        currentCategory = Category.launch;
                        populateRecipeListByCategory("launch");
                      });
                    },
                    text: 'Launch',
                    color: currentCategory == Category.launch ? Colors.white : kDarkGray,),
                ],
              ),
            ),
            SizedBox(height: 15.0,),

            recipeListByCategory.isEmpty ? SizedBox( height: MediaQuery.of(context).size.height * 0.55, child: Center(child: Text('No Recipes found'),)) : Container(
              height: MediaQuery.of(context).size.height * 0.55,
              margin: EdgeInsets.only(top: 30.0),
              child: GridView.count(
                shrinkWrap: false,
                physics: ClampingScrollPhysics(),
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  for (var i = 0; i < recipeListByCategory.length; i++)
                  RecipeCard(
                    onTap: () {},
                    favoriteIcon: Icons.favorite,
                    imageAsset: recipeListByCategory[i].imageUrl,
                    recipeName: recipeListByCategory[i].title,
                    cookingTime: '${recipeListByCategory[i].cookingTime}',
                    starIcon: Icons.star,
                    rating: '${recipeListByCategory[i].rating}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void populateRecipeListByCategory(String category) {
     recipeListByCategory = [];
    if (recipeList.isNotEmpty){
      for (var recipe in recipeList) { if(recipe.recipeCategory.toString().toLowerCase() == category.toLowerCase()) recipeListByCategory.add(recipe); }
    }
  }
}


// GridView.count(
// crossAxisCount: 2,
// scrollDirection: Axis.vertical,
// children: [
// RecipeCard(
// onTap: () {
//
// },
// favoriteIcon: Icons.favorite,
// imageAsset: recipeList[0].imageUrl,
// recipeName: recipeList[0].title,
// cookingTime: '15 min',
// starIcon: Icons.star,
// rating: '4.7',
// ),
// ],
// ),

// SingleChildScrollView(
// child: Column(
// children: [
// Row(
// children: [
// RecipeCard(
// onTap: () {
//
// },
// favoriteIcon: Icons.favorite,
// imageAsset: recipeList[0].imageUrl,
// recipeName: recipeList[0].title,
// cookingTime: '15 min',
// starIcon: Icons.star,
// rating: '4.7',
// ),
// SizedBox(width: 20.0,),
// RecipeCard(
// onTap: () {
//
// },
// favoriteIcon: Icons.favorite_border,
// imageAsset: recipeList[1].imageUrl,
// recipeName: 'Grilled salmon with avocado',
// cookingTime: '15 min',
// starIcon: Icons.star_border,
// rating: '5.0',
// ),
// ],
// ),
// Text('${recipeList[0].id}'),
// ],
// ),
// ),