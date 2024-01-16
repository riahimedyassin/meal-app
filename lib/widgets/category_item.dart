import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.item, super.key});
  final Category item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [item.color.withOpacity(0.8), item.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Text(
        item.title,
      ),
    );
  }
}
