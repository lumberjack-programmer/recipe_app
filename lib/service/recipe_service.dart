import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeService {


  Future<http.Response> fetchRecipes() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/recipes'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

}