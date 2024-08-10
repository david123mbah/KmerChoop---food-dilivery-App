import 'package:flutter/material.dart';
import 'package:musicapp/components/my_cardtile.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;
 
        return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Cart",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )),
          ),
          body: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {

                // get Individual cart item
                




                // ignore: non_constant_identifier_names
                final CartItem = userCart[index];
                
                // return cart tile UI
                 return MyCartTile(
                  cartItem: CartItem
                 );
                },
              ),
              )
              
            ],
          ),
        );
      },
    );
  }
}
