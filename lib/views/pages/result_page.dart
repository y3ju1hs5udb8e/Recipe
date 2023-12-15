import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/food_provider.dart';
import 'package:food_app/views/widgets/video_player.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchItems(item));
    return Scaffold(
      body: data.when(
        data: (data) {
          final link = data[0].strYoutube.split('=');
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: double.infinity,
                    height: 400,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: VideoPlayer(link: link[1])),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data[0].strMeal,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        data[0].strCategory,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'A famous food from ${data[0].strArea}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Tags: ${data[0].strTags}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Text(
                  'How to make?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    data[0].strInstructions,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) =>
            const Center(child: Text('No recipe found for this item')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
