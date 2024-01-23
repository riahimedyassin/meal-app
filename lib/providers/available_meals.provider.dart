import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters.provider.dart';
import 'package:meal_app/providers/meals.provider.dart';

final availableMealsProvider = Provider((ref) {
  final filters = ref.watch(filterProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((element) {
    if (filters[Filter.gluten]! && !element.isGlutenFree) return false;
    if (filters[Filter.vegan]! && !element.isVegan) return false;
    if (filters[Filter.vegertarian]! && !element.isVegetarian) return false;
    if (filters[Filter.lactose]! && !element.isLactoseFree) return false;
    return true;
  }).toList();
});
