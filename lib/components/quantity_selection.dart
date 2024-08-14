import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  // ignore: non_constant_identifier_names
  final VoidCallback OnIncrement;
  // ignore: non_constant_identifier_names
  final VoidCallback OnDecrement;

  const QuantitySelector(
      {super.key,
      required this.food,
      required this.quantity,
      // ignore: non_constant_identifier_names
      required this.OnDecrement,
    
      required this.OnIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // decrease button
          GestureDetector(
            onTap: OnDecrement,
            child: Icon(
              Icons.remove,
              size: 23,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // quantity Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
                child: Center(
              child: Text(quantity.toString()),
            )),
          ),
          // increase button
          GestureDetector(
            onTap: OnIncrement,
            child: Icon(
              Icons.add,
              size: 23,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
