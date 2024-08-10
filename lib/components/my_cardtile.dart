import 'package:flutter/material.dart';
import 'package:musicapp/components/quantity_selection.dart';
import 'package:musicapp/models/cart.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';


class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key,
  required this.cartItem
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: ( context, restaurant ,  child) =>
     Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // food image 
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                  ),
                ),
            
                const SizedBox(height: 10,),
            
                // name and price 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(cartItem.food.name),
                    // food price
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Text( "\$" + cartItem.food.price.toString()),
            
            
                  ],
                ),

                const Spacer(),
            
            
            
                // increament or decrement quantity
                QuantitySelector(
                  food: cartItem.food, 
                  quantity: cartItem.quantity, 
                  OnDecrement: () {
                    restaurant.removeFromCart(cartItem);
                  }, 
                  OnIncrement: () {
                    restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                  }
                  ),
            
              ],
            ),
          ),
          // Addons
        ],
      ),
    ),);
  }
}