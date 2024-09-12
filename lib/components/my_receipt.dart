import 'package:flutter/material.dart';
import 'package:musicapp/pages/homepage.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyReceipt extends StatefulWidget {


  const MyReceipt({super.key});

  @override
  State<MyReceipt> createState() => _MyReceiptState();
}

class _MyReceiptState extends State<MyReceipt> {
  void _login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayCartReceipt()),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Estimate delivery time 15-30 minutes "),
            const SizedBox(height: 45),
            Image.asset(
              "lib/assets/images/me.png",
              width: 150,
              height: 150,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .moveX(
                  begin: -20,
                  end: 20,
                  duration: const Duration(
                      seconds: 2), // Reduced duration to 0.5 seconds
                  curve: Curves.easeInOut,
                )
                .then()
                .moveX(
                  begin: 20,
                  end: -20,
                  duration: const Duration(
                      seconds: 2), // Reduced duration to 0.5 seconds
                  curve: Curves.easeInOut,
                ),
                const SizedBox(height: 20,),
      
                MyButton(text: "Return to Home", onTap: () => _login(context), ),
                    const SizedBox(height: 20,),
                const Text("You can track your Delivery navigate to track page  "),
                const SizedBox(height: 20,),


                const Text("Thanks for your order! and scenshot your receipt ").animate().fadeIn()
          ],
        ),
      ),
    );
  }
}
