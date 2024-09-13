import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 14,
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('1000 XAF', style: myPrimaryTextStyle),
              Text("Delivery fee", style: mySecondaryTextStyle),
            ],
          ),
          Column(
            children: [
              Text('15-30 min', style: myPrimaryTextStyle),
              Text('Delivery time', style: mySecondaryTextStyle),
            ],
          ),
        ],
      ).animate().scale(begin: const Offset(0.8, 1.0), duration: 600.ms, curve: Curves.easeOutBack).fadeIn(duration: 600.ms),
    );
  }
}

