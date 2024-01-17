import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({
    required this.meals,
    required this.title,
    super.key,
  });
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16, 
          crossAxisSpacing: 16
        ),
        padding: const EdgeInsets.all(16),
        children: [for (var item in meals) MealItem(meal: item)],
      ),
    );
  }
}
