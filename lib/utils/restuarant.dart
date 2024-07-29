import 'package:musicapp/models/food.dart';


class Restaurant {

 final List<Food> _menu = [


  // list of maindishs
  Food(
    name: "Classic Chesseburger",
    description: " Ajuicy patty with melted chadder , lettuce souce and a hint of onion and packle", 
    imagePath: "lib/assets/images/pexels-aimbere-elorza-1176843138-27220878.jpg", 
    price: 1.25,
     category: FoodCategories.maindish, 
    availableAddons: [
      Addon(name: "Extra large", price: 2.50),
      Addon(name: "Extra meat", price: 1.80),
      Addon(name: "With Avocado", price: 2.10),
    ]
  ),
  Food(
    name: "PanCake",
    description: " A juicy patty with Honey ,  souce and a hint of  and packle", 
    imagePath: "lib/assets/images/pancake.jpg", 
    price: 1.0,
     category: FoodCategories.maindish, 
    availableAddons: [
      Addon(name: "Extra large", price: 1.50),
      Addon(name: "Extra Honey", price: 1.20),
      Addon(name: "With Tie", price: 2.10),
    ]
  ),
  Food(
    name: "Chicken",
    description: " A nice meal with alots of flavours and a satisfaction garanteed with a taste of haven", 
    imagePath: "lib/assets/images/chicken.jpg", 
    price: 3.0,
     category: FoodCategories.maindish, 
    availableAddons: [
      Addon(name: "Double size", price: 5.50),
      Addon(name: "Extra Moyonese", price: 3.20),
      Addon(name: "With Fried plantains", price: 4.10),
    ]
  ),
   Food(
    name: "Pizza",
    description: "Traditional itatian pizza cooked on fire with atleast five different flavours garanteed", 
    imagePath: "lib/assets/images/pazza.jpg", 
    price: 4.10,
     category: FoodCategories.maindish, 
    availableAddons: [
      Addon(name: "Double size", price: 5.50),
      Addon(name: "With drink", price: 7.20),
      Addon(name: "Without tomatoes", price: 3.10),
    ]
  ),

  // salad 


  


 ];





}