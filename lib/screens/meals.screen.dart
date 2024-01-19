import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details.screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Meals extends StatefulWidget {
  Meals({
    required this.meals,
    required this.title,
    required this.toggleFavortie,
    super.key,
  });
  final String title;
  final List<Meal> meals;
  final void Function(Meal) toggleFavortie;
  int gridCount = 1;

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.gridCount = widget.gridCount == 1 ? 2 : 1;
                });
              },
              icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.gridCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        padding: const EdgeInsets.all(16),
        children: [
          for (var item in widget.meals)
            MealItem(
              meal: item,
              toggleMeal: widget.toggleFavortie,
            )
        ],
      ),
    );
  }
}
