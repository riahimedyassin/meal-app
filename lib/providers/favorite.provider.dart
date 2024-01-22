import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifiter extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifiter() : super([]);
  bool toggleMeal(Meal m) {
    if (state.contains(m)) {
      state = state.where((el) => el.id != m.id).toList();
      return false;
    }
    state = [...state, m];
    return true;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifiter, List<Meal>>((ref) {
  return FavoriteMealsNotifiter();
});
