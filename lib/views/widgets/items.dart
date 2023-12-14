import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/food_provider.dart';
import 'package:food_app/views/pages/item_page.dart';
import 'package:get/get.dart';

class Items extends ConsumerWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allFoods = ref.watch(allFood);
    return allFoods.when(
      data: (data) {
        return Container(
          width: double.infinity,
          height: 510,
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 4 / 5,
            ),
            itemBuilder: (context, index) {
              final foods = data[index];
              return InkWell(
                onTap: () {
                  Get.to(() => ItemPage(item: foods.strCategory),
                      transition: Transition.downToUp);
                },
                child: Card(
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          foods.strCategoryThumb,
                          width: 220,
                          height: 100,
                        ),
                        Text(
                          foods.strCategory,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          foods.strCategoryDescription,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('$error : Error Occured'),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
