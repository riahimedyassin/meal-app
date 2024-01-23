import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/available_meals.provider.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Meals extends ConsumerStatefulWidget {
  Meals({
    required this.meals,
    required this.title,
    super.key,
  });
  final String title;
  final List<Meal> meals;
  int gridCount = 1;

  @override
  ConsumerState<Meals> createState() => _MealsState();
}

class _MealsState extends ConsumerState<Meals> {
  @override
  Widget build(BuildContext context) {
    final filteredMeals = widget.meals;
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
          for (var item in filteredMeals)
            MealItem(
              meal: item,
            )
        ],
      ),
    );
  }
}
