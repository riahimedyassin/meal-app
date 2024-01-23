import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite.provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    required this.meal,
    super.key,
  });
  final Meal meal;
  void _showMessage(BuildContext ctx, bool added) {
    String message = added
        ? "Meal added to your favorite"
        : "Meal delted from your favorite";
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exist = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              bool added =
                  ref.read(favoriteMealsProvider.notifier).toggleMeal(meal);
              _showMessage(context, added);
            },
            icon: Icon(exist ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Ingredients",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                ...meal.ingredients.map((e) {
                  return Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(e),
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Steps",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Column(
              children: [
                ...meal.steps.map((e) {
                  return Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
