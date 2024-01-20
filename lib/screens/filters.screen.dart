import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: const MainDrawer(),
      body: Column(),
    );
  }
}