import 'dart:ffi';

class CategoryApi {
  final List<dynamic> data;

  CategoryApi({required this.data});

   factory CategoryApi.fromJson(List<dynamic> json) {
    return CategoryApi(
        data: json,
    );
  }
}