import 'package:dio/dio.dart';
import 'package:food_app/constants/api.dart';
import 'package:food_app/model/all_food.dart';
import 'package:food_app/model/item_food.dart';
import 'package:food_app/model/popular.dart';

import '../model/recipe_model.dart';

class AllFoodService {
  static final dio = Dio();

  static Future<List<AllFood>> getAllFood() async {
    try {
      final response = await dio.get(Api.homePage);
      return (response.data['categories'] as List)
          .map((e) => AllFood.fromJson(e))
          .toList();
    } on DioException catch (err) {
      throw '$err';
    }
  }
}

class PopularService {
  static final dio = Dio();

  static Future<List<Popular>> getPopularFood() async {
    try {
      final res = await dio.get(Api.popular);
      return (res.data['meals'] as List)
          .map((e) => Popular.fromJson(e))
          .toList();
    } on DioException catch (err) {
      throw 'Error found: ${err.response}';
    }
  }
}

class ItemService {
  static final dio = Dio();

  static Future<List<ItemFood>> getFoodItems({required String item}) async {
    try {
      final res = await dio.get('${Api.detailPage}$item');
      return (res.data['meals'] as List)
          .map((e) => ItemFood.fromJson(e))
          .toList();
    } on DioException catch (err) {
      throw 'Error found: ${err.response}';
    }
  }
}

class SearchService {
  static final dio = Dio();

  static Future<List<Recipe>> getItems({required String item}) async {
    try {
      final res = await dio.get('${Api.bySearch}$item');
      return (res.data['meals'] as List)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } on DioException catch (err) {
      throw 'Error found: ${err.response}';
    }
  }
}
