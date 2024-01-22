import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters.provider.dart';
import 'package:meal_app/screens/filters.screen.dart';
import 'package:meal_app/screens/tabs.screen.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerState();
}

Map<Filter, bool> initalFilter = {
  Filter.gluten: false,
  Filter.lactose: false,
  Filter.vegan: false,
  Filter.vegertarian: false,
};

class _MainDrawerState extends ConsumerState<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    var _selectedFilter = ref.watch(filterProvider);
    final colorShema = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorShema.primaryContainer,
                  colorShema.primaryContainer.withOpacity(0.8)
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: colorShema.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Meal App",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: colorShema.primary),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => Tabs(),
                ),
              );
            },
            leading: const Icon(Icons.food_bank),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: colorShema.primary),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const Filters(),
                ),
              );
            },
            leading: const Icon(Icons.settings),
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: colorShema.primary),
            ),
          )
        ],
      ),
    );
  }
}
