import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class Foodpage extends StatelessWidget {
  final Food food;

  const Foodpage({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(food.imagePath , width: 500, height: 400, fit: BoxFit.cover,),
            

            // Container

            // food name
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // food price 
                   Text(
                      food.price.toString(),
                      style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary),
                    ),

                    const SizedBox(height: 10,),
                  // food description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      food.description,
                      style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
