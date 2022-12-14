import 'package:flutter/material.dart';
import '../constants.dart';


class RecipeCard extends StatelessWidget {

  IconButton favoriteIcon;
  String imageAsset;
  String recipeName;
  String cookingTime;
  IconData starIcon;
  String rating;
  VoidCallback onTap;


  RecipeCard({required this.favoriteIcon, required this.imageAsset, required this.recipeName,
    required this.cookingTime, required this.starIcon, required this.rating, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: kVeryDarkGray,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  favoriteIcon,
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                width: 110.0,
                height: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(imageAsset)),
                ),
              ),
              Container(
                height: 70.0,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(recipeName),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$cookingTime min', style: TextStyle(color: kDarkGray),),
                  Row(
                    children: [
                      Icon(starIcon, color: kVividOrange, size: 18.0,),
                      SizedBox(width: 3.0,),
                      Text(rating, style: TextStyle(color: kDarkGray),),
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