import 'package:flutter/material.dart';

import '../models/food_category.dart';

class CategoryCard extends StatelessWidget {
  final FoodCategory category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
      displayColor: Theme.of(context).colorScheme.onSurface,
    );
    final image = category.imageUrl.startsWith('http')
        ? Image.network(category.imageUrl, fit: BoxFit.cover)
        : const SizedBox(height: 120, child: Center(child: Icon(Icons.restaurant)));
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: SizedBox(width: double.infinity, child: image),
          ),
          ListTile(
            title: Text(category.name, style: textTheme.titleSmall),
            subtitle: Text('${category.numberOfRestaurants} places', style: textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
