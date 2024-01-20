import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.screen.dart';
import 'package:meal_app/screens/filters.screen.dart';
import 'package:meal_app/screens/meals.screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteList = [];

  void _toggleMeal(Meal m) {
    setState(() {
      if (_favoriteList.contains(m)) {
        _favoriteList.remove(m);
        _showSnackBar("Removed from favorite");
      } else {
        _favoriteList.add(m);
        _showSnackBar("Added to favorite");
      }
    });
  }

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
    Widget activePage = Categories(
      toggleMeal: _toggleMeal,
    );
    if (_selectedPageIndex == 1) {
      activePage = Meals(
        meals: _favoriteList,
        title: "Favorite",
        toggleFavortie: _toggleMeal,
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
