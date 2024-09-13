import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/models/food.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> _selectedAddons;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _selectedAddons = {for (var addon in widget.food.availableAddons) addon: false};
  }

  void _addToCart() {
    final selectedAddons = _selectedAddons.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    context.read<Restaurant>().addToCart(widget.food, selectedAddons, _quantity);
    Navigator.pop(context); // Go back to previous page after adding to cart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Food Image
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ).animate().fadeIn(duration: 500.ms),
                // Back Arrow
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Food Details
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Name and Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.food.name,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (_quantity > 1) {
                                  setState(() => _quantity--);
                                }
                              },
                            ),
                            Text('$_quantity', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => setState(() => _quantity++),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Food Description
                  Text(
                    widget.food.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // Add-ons
                  const Text(
                    "Add Extra Additional",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        final addon = widget.food.availableAddons[index];
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('${addon.price} XAF'),
                          value: _selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() => _selectedAddons[addon] = value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add to Cart Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyButton(
              text: "Add to cart - ${widget.food.price * _quantity} XAF",
              onTap: _addToCart,
            ).animate().scale(begin: const Offset(0.8, 1.0), duration: 300.ms),
          ),
        ],
      ),
    );
  }
}