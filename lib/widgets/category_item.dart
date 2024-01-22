import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/providers/meals.provider.dart';
import 'package:meal_app/screens/meals.screen.dart';

class CategoryItem extends ConsumerStatefulWidget {
  const CategoryItem({required this.item, super.key});
  final Category item;

  @override
  ConsumerState<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends ConsumerState<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          final filteredMeals = meals
              .where((element) => element.categories.contains(widget.item.id))
              .toList();
          return Meals(
            title: widget.item.title,
            meals: filteredMeals,
          );
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
              widget.item.color.withOpacity(0.8),
              widget.item.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          widget.item.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
