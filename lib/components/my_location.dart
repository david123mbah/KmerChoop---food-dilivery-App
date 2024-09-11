import 'package:flutter/material.dart';  // Fixed the spelling here
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';

class Mylocation extends StatelessWidget {
  const Mylocation({super.key});

  void _openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: const TextField(
          decoration: InputDecoration(
            hintText: "Search address...",
          ),
        ),
        actions: [
          // Cancel location
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          // Save location
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligned text to start
        children: [
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => _openLocationSearchBox(context),
            child: Row(
              children: [
                // Location
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.diliveryAddress, // Assuming `location` is the correct field
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Drop down menu icon
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
