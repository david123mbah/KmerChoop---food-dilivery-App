import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';
import 'package:musicapp/widgets/my_button.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> selectedAddons;

  @override
  void initState() {
    super.initState();
    selectedAddons = {
      for (var addon in widget.food.availableAddons) addon: false
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Food Image
              Image.asset(
                widget.food.imagePath,
                width: 500,
                height: 400,
                fit: BoxFit.cover,
              ),
      
              // Food Details Container
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food Name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
      
                    // Food Price
                    Text(
                      '\$${widget.food.price.toString()}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
      
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(height: 10),
      
                    // Add-Ons Title
                    Text(
                      "Add-Ons",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
      
                    // Food Description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
      
                    // Add-Ons List
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          // Get individual addon
                          Addon addon = widget.food.availableAddons[index];
                          return CheckboxListTile(
                            title: Text(addon.name),
                            value: selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      
              // Add to Cart Button
              MyButton(
                text: "Add to cart",
                onTap: () {},
              ),
      
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      // back arrow
      SafeArea(child: Opacity(
        opacity: 0.5,
        child: Container(
          margin: const EdgeInsets.only(left: 25,),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
        
          ),
          child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
      ))
    ]);
  }
}
