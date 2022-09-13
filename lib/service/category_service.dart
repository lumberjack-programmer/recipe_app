

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryService {


  Future<http.Response> fetchCategories() async {
    final response = await http.get(Uri.parse('http://localhost:8080/categories'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

}