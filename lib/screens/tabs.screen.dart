import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite.provider.dart';
import 'package:meal_app/providers/private/navbar.provider.dart';
import 'package:meal_app/screens/categories.screen.dart';
import 'package:meal_app/screens/meals.screen.dart';

class Tabs extends ConsumerWidget {
  const Tabs({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedPageIndex = ref.watch(navbarProvider);
    final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
    Widget activePage = const Categories();
    if (selectedPageIndex == 1) {
      activePage = Meals(
        meals: favoriteMeal,
        title: "Favorite",
      );
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.watch(navbarProvider.notifier).switchPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favortie",
          ),
        ],
      ),
    );
  }
}
