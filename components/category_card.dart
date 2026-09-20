import 'package:flutter/material.dart';

import '../models/food_category.dart';

class CategoryCard extends StatelessWidget {
  final FoodCategory category;

  const CategoryCard({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: Get text theme
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    // TODO: Replace with Card widget
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                ),
                child: Image.asset(\n                  category.imageUrl,\n                  errorBuilder: (context, error, stackTrace) => const SizedBox(\n                    height: 120,\n                    child: Center(child: Icon(Icons.image_not_supported_outlined)),\n                  ),\n                ),
              ),
            ],
          ),
          ListTile(
            title: Text(
              category.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(
              '${category.numberOfRestaurants} places',
              style: textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}