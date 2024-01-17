import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    super.key,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black38,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
