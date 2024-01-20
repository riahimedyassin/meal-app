import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs.screen.dart';
import 'package:meal_app/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: theme,
      home: const Tabs(),
    );
  }
}
