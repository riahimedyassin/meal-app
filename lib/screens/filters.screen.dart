import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters.provider.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    bool _glutenFreeFilter = activeFilters[Filter.gluten]!;
    bool _veganFilter = activeFilters[Filter.vegan]!;
    bool _vegetarianFilter = activeFilters[Filter.vegertarian]!;
    bool _lactoseFreeFilter = activeFilters[Filter.lactose]!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      // drawer: const MainDrawer(),
      body: Column(
        children: [
          customSwitch(
            context,
            (bool newValue) => ref.read(filterProvider.notifier).setFilter(
                  Filter.gluten,
                  newValue,
                ),
            _glutenFreeFilter,
            "Gluten Free",
            "Food that does not contain gluten",
          ),
          customSwitch(
            context,
            (bool newValue) => ref.read(filterProvider.notifier).setFilter(
                  Filter.vegan,
                  newValue,
                ),
            _veganFilter,
            "Vegan Food",
            "Vegan Food",
          ),
          customSwitch(
            context,
            (bool newValue) => ref.read(filterProvider.notifier).setFilter(
                  Filter.vegertarian,
                  newValue,
                ),
            _vegetarianFilter,
            "Vegetarian ",
            "Food that does not contain meat",
          ),
          customSwitch(
            context,
            (bool newValue) => ref.read(filterProvider.notifier).setFilter(
                  Filter.lactose,
                  newValue,
                ),
            _lactoseFreeFilter,
            "Lactose Free",
            "Food that does not contain lactose",
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    var context,
    Function(bool newValue) onChange,
    bool filter,
    String title,
    String subtitle,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(subtitle),
      value: filter,
      onChanged: (bool value) {
        log(filter.toString());
        onChange(value);
      },
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
