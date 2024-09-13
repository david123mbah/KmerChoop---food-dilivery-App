import 'package:flutter/material.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';
import 'package:musicapp/components/my_receipt.dart';
import 'package:musicapp/services/auth/database.dart';

class DeliveryPage extends StatefulWidget {
  
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  late FirestoreService _db;

  @override
  void initState() {
    super.initState();
    _db = FirestoreService();
    _saveOrder();
  }

  // Method to save order to database
  Future<void> _saveOrder() async {
    final receipt = context.read<Restaurant>().displayCartReceipt();
    await _db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const SingleChildScrollView(
        child: Column(
          
          children: [
            Padding(
              padding: EdgeInsets.all(26.0),
              child: Center(child: Text("Receipt ")),
            ),
            MyReceipt(),
          ],
        ),
      ),
    );
  }
}
