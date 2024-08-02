import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class Foodpage extends StatelessWidget {

   final Food food;


  const Foodpage({super.key ,
  required this.food,
  
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(food.imagePath),


          // Container 
          
          // food name 
          Text(food.name),
      
      
          // food description
          Text(food.description),
      
      
          // addons
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: food.availableAddons.length,
            itemBuilder: ((context, index) {
              return CheckboxListTile(value: false, onChanged: (value) {},);
            }),
          )
        ],
      ),
    );
  }
}