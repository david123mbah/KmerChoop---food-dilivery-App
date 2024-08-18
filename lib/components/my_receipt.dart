import 'package:flutter/material.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thanks for your order!"),
          const SizedBox(height: 25,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(8),
            ),
             child: const Padding(
               padding: EdgeInsets.all(25.0),
               child: Text(" Receipt here ..."),
             ),
          )
        ],
      ),
    );
  }
}