import 'package:flutter/material.dart';
import 'package:musicapp/components/delivery_info%20row.dart';
import 'package:musicapp/pages/deliverypage.dart';
import 'package:musicapp/widgets/my_button.dart';

class DeliveryInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Track Order', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
          const SizedBox(height: 16),
          const DeliveryInfoRow(icon: Icons.access_time, text: 'Your Delivery Time\n12 Minutes'),
          const SizedBox(height: 8),
          const DeliveryInfoRow(icon: Icons.location_on, text: 'Your Delivery Address\n'),
          const SizedBox(height: 16),
          MyButton(
            text: 'Order Details',
            onTap: () {
              // Handle order details action
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeliveryPage()));
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showDeliveryInfoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (BuildContext context) {
        return DeliveryInfoCard(); // Show the DeliveryInfoCard as a bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track order')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDeliveryInfoSheet(context),
          child: const Text('Track Order',),
        ),
      ),
    );
  }
}
