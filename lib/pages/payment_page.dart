import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:musicapp/widgets/my_button.dart';


class PaymentPage extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
   
   String cardNumber = '';
   String expiryDate = '';
   String cardHolderName   =  '';
   String cvvCode = ''; 
   bool isCvvFocused   = false;


   // user wants to pay 
   void userTappedPay() {
    if (formkey.currentState!.validate()) {
      // only show dialog if form is valid 
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content:  SingleChildScrollView(
            child: ListBody(children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $cardNumber"),
              Text("Card Holder name: $cardNumber"),
              Text("CVV: $cvvCode")

            ],),
          ),

          actions: [
            TextButton(onPressed: () => Navigator.pop(context),
              
            child: Text("Cancel")),


            
            TextButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeliveryPage())), 
            child: Text("Yes")),
          ],

        ),
      );
    }
   }
   





   PaymentPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Checkout")),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0) {},
          
          ),
          CreditCardForm(
            cardNumber: cardNumber,
             expiryDate: expiryDate, 
             cardHolderName: cardHolderName, 
             cvvCode: cvvCode, 
             onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              
             });

             }, 
             formKey: formkey,
             
            ),

            const Spacer(),

            MyButton(text: "Pay now", onTap: () {

            }), 

            const SizedBox(height: 25,)
        ],
      ),
      
        // credit card form 
      
    );
  }
}