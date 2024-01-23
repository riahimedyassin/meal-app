
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class Categories extends ConsumerWidget {
  const Categories( {super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      drawer: const MainDrawer(),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 5 / 4),
          children: [
            ...availableCategories.map((e) => CategoryItem(
                  item: e
                ))
          ],
        ),
      ),
    );
  }
}
