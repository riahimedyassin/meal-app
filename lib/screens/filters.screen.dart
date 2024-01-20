import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  const Filters(Map<Filter, bool> currentFilter, {super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

enum Filter { gluten, vegan, vegertarian, lactose }

class _FiltersState extends State<Filters> {
  bool _glutenFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  bool _lactoseFreeFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      // drawer: const MainDrawer(),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten: _glutenFreeFilter,
            Filter.lactose: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegertarian: _vegetarianFilter
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(
              context,
              (bool newValue) => setState(() {
                _glutenFreeFilter = newValue;
              }),
              _glutenFreeFilter,
              "Gluten Free",
              "Food that does not contain gluten",
            ),
            customSwitch(
              context,
              (bool newValue) => setState(() {
                _veganFilter = newValue;
              }),
              _veganFilter,
              "Vegan Food",
              "Vegan Food",
            ),
            customSwitch(
              context,
              (bool newValue) => setState(() {
                _vegetarianFilter = newValue;
              }),
              _vegetarianFilter,
              "Gluten Free",
              "Food that does not contain meat",
            ),
            customSwitch(
              context,
              (bool newValue) => setState(() {
                _lactoseFreeFilter = newValue;
              }),
              _lactoseFreeFilter,
              "Lactose Free",
              "Food that does not contain lactose",
            ),
          ],
        ),
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
      onChanged: onChange,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
