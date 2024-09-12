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
  // ignore: library_private_types_in_public_api
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> _selectedAddons;
  bool _showSuccessMessage = false;

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
    context.read<Restaurant>().addToCart(widget.food, selectedAddons, selectedAddons.length );
    setState(() {
      _showSuccessMessage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Animated Food Image
                Image.asset(
                  widget.food.imagePath,
                  width: 500,
                  height: 400,
                  fit: BoxFit.cover,
                )
                .animate()
                .fadeIn(duration: 500.ms)
                .scale(begin: const Offset(0.8, 1.0)),
                
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Animated Food Name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().slideX(duration: 500.ms),

                      // Animated Food Price
                      Text(
                        '${widget.food.price.toString()} XAF',
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ).animate().fadeIn(duration: 500.ms),

                      const Divider(),
                      const SizedBox(height: 10),

                      // Add-Ons Title
                      Text(
                        "Add-Ons",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ).animate().slideX(duration: 500.ms),

                      // Animated Food Description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ).animate().fadeIn(duration: 500.ms),

                      // Add-Ons List
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            final addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              value: _selectedAddons[addon]!,
                              onChanged: (value) {
                                setState(() {
                                  _selectedAddons[addon] = value!;
                                });
                              },
                            ).animate().fadeIn(duration: 500.ms);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Animated Add to Cart Button
                MyButton(
                  text: "Add to cart",
                  onTap: _addToCart,
                )
                .animate()
                .scale(begin: const Offset(0.8, 1.0), duration: 300.ms),

                if (_showSuccessMessage)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Added to cart successfully! Enjoy your meal.",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(duration: 500.ms),
                  ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        
        // Back Arrow
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ).animate().scale(duration: 300.ms),
        ),
      ],
    );
  }
}
