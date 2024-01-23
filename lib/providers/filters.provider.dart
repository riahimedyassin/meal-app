

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

enum Filter { gluten, vegan, vegertarian, lactose }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super(
          {
            Filter.gluten: false,
            Filter.lactose: false,
            Filter.vegan: false,
            Filter.vegertarian: false,
          },
        );
  void setFilter(Filter f, bool value) {
    state = {...state, f: value};
  }

  List<Meal> filteredMeals(List<Meal> list) {
    final filteredMeals = list.where((element) {
      if (state[Filter.gluten]! && !element.isGlutenFree) return false;
      if (state[Filter.vegan]! && !element.isVegan) return false;
      if (state[Filter.vegertarian]! && !element.isVegetarian) return false;
      if (state[Filter.lactose]! && !element.isLactoseFree) return false;
      return true ; 
    }).toList();
    return filteredMeals;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});
