import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({required this.meal, super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
