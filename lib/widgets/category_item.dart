import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.item, super.key});
  final Category item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          final filteredMeals = dummyMeals.where((element) => element.categories.contains(item.id)).toList() ; 
          return Meals(title: item.title,meals: filteredMeals,);
        }));
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.8),
              item.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          item.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
