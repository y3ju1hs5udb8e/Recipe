import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/services/api_services.dart';

final allFood = FutureProvider((ref) => AllFoodService.getAllFood());

final popularFood = FutureProvider((ref) => PopularService.getPopularFood());

final foodItems = FutureProvider.family(
    (ref, String item) => ItemService.getFoodItems(item: item));

final searchItems = FutureProvider.family(
    (ref, String item) => SearchService.getItems(item: item));
