import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/views/pages/item_page.dart';
import 'package:food_app/views/widgets/items.dart';
import 'package:food_app/views/widgets/pouplar_foods.dart';
import 'package:get/get.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'cooked',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 70,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  Get.to(() => ItemPage(item: value.trim()),
                      transition: Transition.downToUp);
                },
                style: const TextStyle(fontSize: 30),
                controller: search,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 35,
                  ),
                  hintText: 'Search Food',
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const Text(
              'Popular Today.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const PopularFoods(),
            const Text(
              'All Items.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Items(),
          ],
        ),
      ),
    );
  }
}
