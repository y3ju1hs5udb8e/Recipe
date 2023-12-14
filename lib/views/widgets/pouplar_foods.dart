import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/food_provider.dart';

class PopularFoods extends ConsumerWidget {
  const PopularFoods({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularData = ref.watch(popularFood);
    return popularData.when(
      data: (data) {
        return Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final food = data[index];
              return Container(
                width: 220,
                height: 220,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        food.strMealThumb,
                        width: 180,
                        height: 180,
                      ),
                    ),
                    Text(
                      food.strMeal,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('$error'),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
