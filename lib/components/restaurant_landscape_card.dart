import 'package:flutter/material.dart';
import 'package:foodly/screens/restaurant_page.dart';

import '../models/restaurant.dart';

class RestaurantLandscapeCard extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantLandscapeCard({super.key, required this.restaurant});

  @override
  State<RestaurantLandscapeCard> createState() => _RestaurantLandscapeCardState();
}

class _RestaurantLandscapeCardState extends State<RestaurantLandscapeCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
      displayColor: Theme.of(context).colorScheme.onSurface,
    );
    final image = widget.restaurant.imageUrl.startsWith('http')
        ? Image.network(widget.restaurant.imageUrl, fit: BoxFit.cover)
        : Container(color: Colors.grey.shade200, child: const Icon(Icons.restaurant, size: 48));
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  image,
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
                      iconSize: 30,
                      color: Colors.red[400],
                      onPressed: () => setState(() => _isFavorited = !_isFavorited),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(widget.restaurant.name, style: textTheme.titleSmall),
            subtitle: Text(widget.restaurant.attributes, maxLines: 1, style: textTheme.bodySmall),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RestaurantPage(restaurant: widget.restaurant)),
            ),
          ),
        ],
      ),
    );
  }
}
