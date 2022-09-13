import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';

import '../constants.dart';

class RecipeDetails extends StatefulWidget {
  RecipeDetails({ required this.recipeSelected });
  final RecipeAPI recipeSelected;

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {


  //========== INSTAGRAM: @lumberjack_programmer ===========//
  //========== GITHUB: @lumberjack-programmer =============//
  //================== FOLLOW FOR MORE ===================//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVividOrange,
        ),
        backgroundColor: kMostlyBlack,
        actions: [

          IconButton(
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  widget.recipeSelected.favorite = !widget.recipeSelected.favorite;
                });
              }, icon: widget.recipeSelected.favorite == true ? Icon(Icons.favorite, color: kVividOrange,) : Icon(Icons.favorite_border, color: kVividOrange,)),

        ],
      ),
      body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150.0,
                backgroundImage: NetworkImage(widget.recipeSelected.imageUrl),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 30.0,),
              Divider(color: kVividOrange,),
              Text(widget.recipeSelected.title, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),),
              SizedBox(height: 15.0,),
              Text(widget.recipeSelected.description, style: TextStyle(fontSize: 15.0, color: kDarkGray),),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alarm_on, color: kVividOrange,),
                      SizedBox(width: 5.0,),
                      Text('${widget.recipeSelected.cookingTime} min'),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.local_pizza, color: kVividOrange,),
                      SizedBox(width: 5.0,),
                      Text('${(widget.recipeSelected.calories * .5).round()} cal'),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
      ),
    );
  }
}
