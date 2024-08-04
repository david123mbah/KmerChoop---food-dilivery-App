import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class Foodpage extends StatelessWidget {

   final Food food;


  const Foodpage({super.key ,
  required this.food,
  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(food.imagePath),
        
        
            // Container 
            
            // food name 
            Text(
              food.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
        
        
            // food description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                food.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        
        
            // addons
            Material(
          
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: food.availableAddons.length,
                itemBuilder: ((context, index) {
                  // get individual addon 
                  Addon addon = food.availableAddons[index];
                  return CheckboxListTile(
                    title: Text(addon.name),
                    value: false, 
                    onChanged: (value) {},
                    );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}