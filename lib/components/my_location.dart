import 'package:flutter/material.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';

class Mylocation extends StatelessWidget {
  Mylocation({super.key});

  final TextEditingController textController = TextEditingController();

  void _openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
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
            onPressed: () {
              final newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address !",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => _openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.diliveryAddress, // Assuming `deliveryAddress` is the correct field
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

