

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite.provider.dart';
import 'package:meal_app/screens/categories.screen.dart';
import 'package:meal_app/screens/meals.screen.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showSnackBar(String s) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider); 
    Widget activePage = Categories(
    );
    if (_selectedPageIndex == 1) {
      activePage = Meals(
        meals: favoriteMeal,
        title: "Favorite",
       
      );
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
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
