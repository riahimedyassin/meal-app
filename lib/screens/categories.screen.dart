import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          "Meal App",
          style: TextStyle(
            fontSize: Theme.of(context).appBarTheme.titleTextStyle!.fontSize,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 5 / 4),
          children: [...availableCategories.map((e) => CategoryItem(item: e))],
        ),
      ),
    );
  }
}
