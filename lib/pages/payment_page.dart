import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:musicapp/pages/deliverypage.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  bool _isCvvFocused = false;

  void _userTappedPay() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $_cardNumber"),
                Text("Expiry Date: $_expiryDate"),
                Text("Card Holder name: $_cardHolderName"),
                Text("CVV: $_cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const DeliveryPage()));
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Checkout")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _cardHolderName,
              cvvCode: _cvvCode,
              showBackView: _isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            )
                .animate()
                .fadeIn(duration: 800.ms, delay: 300.ms)
                .slideY(begin: 0.2, end: 0)
                .then()
                .shimmer(duration: 1800.ms),
            CreditCardForm(
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _cardHolderName,
              cvvCode: _cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  _cardNumber = data.cardNumber;
                  _expiryDate = data.expiryDate;
                  _cardHolderName = data.cardHolderName;
                  _cvvCode = data.cvvCode;
                });
              },
              formKey: _formKey,
            )
                .animate()
                .fadeIn(duration: 800.ms, delay: 600.ms)
                .slideY(begin: 0.2, end: 0),
            const SizedBox(height: 25),
            MyButton(text: "Pay now", onTap: _userTappedPay)
                .animate()
                .fadeIn(duration: 600.ms, delay: 1000.ms)
                .scale(begin: const Offset(0.8, 1.0))
                .then()
                .shimmer(duration: 1800.ms),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}