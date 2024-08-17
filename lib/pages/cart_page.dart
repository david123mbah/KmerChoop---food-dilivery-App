import 'package:flutter/material.dart';
import 'package:musicapp/components/my_cardtile.dart';
import 'package:musicapp/pages/payment_page.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:musicapp/widgets/my_button.dart';
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
            actions: [
              // clear the cart
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            "Are you sure you want to clear the cart?"),
                        actions: [
                          // cancel delte
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),

                          // yes
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    // get Individual cart item

                    // ignore: non_constant_identifier_names
                    final CartItem = userCart[index];

                    // return cart tile UI
                    return MyCartTile(cartItem: CartItem);
                  },
                ),
              ),
              MyButton(
                  text: "Go to Checkout",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage()))),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        );
      },
    );
  }
}
