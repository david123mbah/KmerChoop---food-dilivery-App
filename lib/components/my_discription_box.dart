import 'package:flutter/material.dart';


class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {

     // text style
     var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
     );
     var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
     );



    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
       padding: const EdgeInsets.all(16),
       margin: const EdgeInsets.only(left: 25, right: 25 , bottom: 20,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('\$0.99', style: myPrimaryTextStyle,),
                Text("Delivery fee" , style: mySecondaryTextStyle,)
              ],
            ),
        
            // delivery time
            Column(
              children: [
                Text('15-30 min', style: myPrimaryTextStyle, ),
                Text('Delivery time' , style: mySecondaryTextStyle,  )
              ],
            )
          ],
        ),
      
    );
  }
}



