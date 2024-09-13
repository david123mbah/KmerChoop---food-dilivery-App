import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/models/cart.dart';
import 'package:musicapp/components/quantity_selection.dart'; // Ensure this path is correct
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    Key? key,
    required this.cartItem, required Null Function() onRemove, required Null Function() onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ).animate(

                  ).fadeIn(duration: 300.ms)
                  .slideX(begin: -0.1, end: 0, duration: 300.ms),
                  
                  const SizedBox(width: 10),
                  
                  // Name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate(
                        
                      ).fadeIn(duration: 300.ms)
                      .slideX(begin: -0.1, end: 0, duration: 300.ms),
                      
                      Text(
                        "${cartItem.food.price * cartItem.quantity} XAF",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ).animate(
                    
                      ).fadeIn(duration: 300.ms)
                      .slideX(begin: -0.1, end: 0, duration: 300.ms),
                    ],
                  ),
                  
                  const Spacer(),
                  
                  // Increment or decrement quantity
                  QuantitySelector(
                    food: cartItem.food,
                    quantity: cartItem.quantity,
                    onDecrement: () {
                      if (cartItem.quantity > 1) {
                        restaurant.updateCartItemQuantity(
                          cartItem,
                          cartItem.quantity - 1,
                        );
                      } else {
                        restaurant.removeFromCart(cartItem);
                      }
                    },
                    onIncrement: () {
                      restaurant.updateCartItemQuantity(
                        cartItem,
                        cartItem.quantity + 1,
                      );
                    },
                  ),
                ],
              ),
            ),
            
            // Addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map((addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name),
                                const SizedBox(width: 4),
                                Text('${addon.price} XAF'),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            onSelected: (value) {},
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
