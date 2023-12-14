import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/food_provider.dart';
import 'package:food_app/views/pages/result_page.dart';
import 'package:get/get.dart';

class ItemPage extends ConsumerWidget {
  const ItemPage({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodItems(item));
    return Scaffold(
      body: foods.when(
        data: (data) {
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 5,
            ),
            itemBuilder: (context, index) {
              final food = data[index];
              return InkWell(
                onTap: () {
                  Get.to(() => ResultPage(item: food.strMeal),
                      transition: Transition.downToUp);
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          food.strMealThumb,
                        ),
                        Text(
                          food.strMeal,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
