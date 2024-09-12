import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.food,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(Icons.remove, onDecrement, context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          _buildIconButton(Icons.add, onIncrement, context),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}