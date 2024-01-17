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
      body: const Text("HOLA AMIGO"),
    );
  }
}
