import 'package:flutter/material.dart';
import 'package:musicapp/components/my_receipt.dart';


class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Delivery in Progess ...."),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}