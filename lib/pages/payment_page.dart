import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:musicapp/pages/deliverypage.dart';
import 'package:musicapp/widgets/my_button.dart';

class PaymentPage extends StatefulWidget {
  @override
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
                  builder: 
                  (context) => const DeliveryPage()));
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
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: _cardNumber,
            expiryDate: _expiryDate,
            cardHolderName: _cardHolderName,
            cvvCode: _cvvCode,
            showBackView: _isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
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
          ),
          const Spacer(),
          MyButton(text: "Pay now", onTap: _userTappedPay),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}