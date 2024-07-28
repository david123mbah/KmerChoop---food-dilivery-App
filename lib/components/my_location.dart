import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mylocation extends StatelessWidget {
  const Mylocation({super.key});


  void openLocationSearchBox(BuildContext context) {
    showDialog(
      
      context: context,
     builder: (context) => AlertDialog(
      title: Text("Your location"),
      content: TextField(
        decoration: InputDecoration(
          hintText: " Search address...",

        ),
      ),
      actions: [
        // cancel location
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),

         MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Save"),
         ),

      ],
     )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //location
                Text("Yaounde , Efoulan ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary , fontWeight: FontWeight.bold)),
                  
                // drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
