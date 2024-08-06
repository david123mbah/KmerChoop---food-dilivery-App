import 'package:collection/collection.dart';
import 'package:collection/equality.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/cart.dart';
import 'package:musicapp/models/food.dart';


class Restaurant  extends ChangeNotifier{

 final List<Food> _menu = [


  // list of maindishs
  Food(
    name: "Classic Chesseburger",
    description: " Ajuicy patty with melted chadder , lettuce souce and a hint of onion and packle", 
    imagePath: "lib/assets/images/pexels-aimbere-elorza-1176843138-27220878.jpg", 
    price: 1.25,
     category: FoodCategories.dish, 
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
     category: FoodCategories.dish, 
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
     category: FoodCategories.dish, 
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
     category: FoodCategories.dish, 
    availableAddons: [
      Addon(name: "Double size", price: 5.50),
      Addon(name: "With drink", price: 7.20),
      Addon(name: "Without tomatoes", price: 3.10),
    ]
  ),

  // salad 
  Food(
name: "Caesar Salad",
description: "Fresh romaine lettuce, grilled chicken, croutons, and homemade Caesar dressing",
imagePath: "lib/assets/images/salad.jpg",
price: 8.99,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Add Bacon", price: 1.50),
Addon(name: "Extra Chicken", price: 2.00),
Addon(name: "Gluten-Free Croutons", price: 0.75)
]
),

Food(
name: "Greek Salad",
description: "Crisp romaine, tomatoes, cucumbers, red onions, Kalamata olives, and feta cheese with Greek dressing",
imagePath: "lib/assets/images/pexels-xmtnguyen-699953.jpg",
price: 7.99,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Add Grilled Chicken", price: 2.50),
Addon(name: "Upgrade to Artisan Greens", price: 1.25),
Addon(name: "Extra Feta Cheese", price: 1.00)
]
),

Food(
name: "Cobb Salad",
description: "Iceberg and romaine lettuce, grilled chicken, hard-boiled egg, bacon, avocado, tomatoes, and blue cheese crumbles",
imagePath: "lib/assets/images/qweqsaa.jpg",
price: 9.99,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Substitute Grilled Salmon", price: 3.00),
Addon(name: "Add Crumbled Feta", price: 1.50),
Addon(name: "Double Protein", price: 3.00)
]
),

Food(
name: "Spinach Salad",
description: "Baby spinach, sliced mushrooms, hard-boiled egg, crispy bacon, and warm bacon dressing",
imagePath: "lib/assets/images/sala2.jpg",
price: 7.49,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Add Grilled Chicken", price: 2.00),
Addon(name: "Substitute Goat Cheese", price: 1.25),
Addon(name: "Extra Bacon", price: 1.50)
]
),

Food(
name: "Fruit Salad",
description: "Assorted fresh seasonal fruits, served with a honey-yogurt dressing",
imagePath: "lib/assets/images/pexels-valeriya-1639556.jpg",
price: 6.99,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Add Grilled Chicken", price: 2.50),
Addon(name: "Sprinkle of Granola", price: 1.00),
Addon(name: "Upgrade to All Organic Fruit", price: 2.00)
]
),

// sides 
// Sides
Food(
name: "French Fries",
description: "Golden brown, crispy fries served with ketchup",
imagePath: "lib/assets/images/pexels-valeriya-1860204.jpg",
price: 2.99,
category: FoodCategories.sides,
availableAddons: [
Addon(name: "Cheese Sauce", price: 1.00),
Addon(name: "Bacon Bits", price: 0.75),
Addon(name: "Chili Topping", price: 1.25)
]
),

Food(
name: "Onion Rings",
description: "Thick-cut, battered and fried onion rings",
imagePath: "lib/assets/images/pexels-janetrangdoan-769969.jpg",
price: 3.49,
category: FoodCategories.sides,
availableAddons: [
Addon(name: "Ranch Dressing", price: 0.50),
Addon(name: "Barbecue Sauce", price: 0.50),
Addon(name: "Sriracha Mayo", price: 0.75)
]
),

Food(
name: "Coleslaw",
description: "Crisp shredded cabbage and carrots in a creamy dressing",
imagePath: "lib/assets/images/pexels-valeriya-1893555.jpg",
price: 2.29,
category: FoodCategories.sides,
availableAddons: []
),

Food(
name: "Garlic Bread",
description: "Thick-sliced bread topped with garlic butter and parmesan",
imagePath: "lib/assets/images/pexels-alesiakozik-6066052.jpg",
price: 2.99,
category: FoodCategories.sides,
availableAddons: [
Addon(name: "Melted Cheese", price: 1.00)
]
),

Food(
name: "Mashed Potatoes",
description: "Creamy mashed potatoes, made with real butter and milk",
imagePath: "lib/assets/images/pexels-nadin-sh-78971847-11776375.jpg",
price: 2.79,
category: FoodCategories.sides,
availableAddons: [
Addon(name: "Gravy", price: 0.75),
Addon(name: "Bacon Bits", price: 0.75),
Addon(name: "Chives", price: 0.50)
]
),

// desserts
Food(
name: "Chocolate Lava Cake",
description: "Warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream",
imagePath: "lib/assets/images/choco.jpg",
price: 7.99,
category: FoodCategories.desert,
availableAddons: [
Addon(name: "Add Caramel Sauce", price: 1.50),
Addon(name: "Upgrade to Salted Caramel Ice Cream", price: 2.00),
Addon(name: "Extra Scoop of Ice Cream", price: 2.50)
]
),

Food(
name: "Classic Cheesecake",
description: "Creamy New York-style cheesecake with a graham cracker crust, topped with fresh strawberries",
imagePath: "lib/assets/images/pexels-proseuz-2373520.jpg",
price: 6.99,
category: FoodCategories.desert,
availableAddons: [
Addon(name: "Add Chocolate Sauce", price: 1.25),
Addon(name: "Substitute Blueberry Topping", price: 1.50),
Addon(name: "Whipped Cream", price: 1.00)
]
),

Food(
name: "Triple pink Chocolate Ice Cream",
description: "Rich and creamy chocolate ice cream with chunks of chocolate and chocolate sauce swirled throughout",
imagePath: "lib/assets/images/anime.jpg",
price: 4.99,
category: FoodCategories.desert,
availableAddons: [
Addon(name: "Add Chocolate Sprinkles", price: 0.75),
Addon(name: "Upgrade to a Double Scoop", price: 2.00),
Addon(name: "Whipped Cream and Cherry", price: 1.50)
]
),

Food(
name: "Tiramisu",
description: "Layers of coffee-soaked ladyfingers, mascarpone cream, and cocoa powder",
imagePath: "lib/assets/images/pexels-teejay-1362534.jpg",
price: 6.49,
category: FoodCategories.desert,
availableAddons: [
Addon(name: "Add a Splash of Amaretto", price: 2.00),
Addon(name: "Extra Dusting of Cocoa", price: 1.00),
Addon(name: "Serve with Espresso", price: 2.50)
]
),

Food(
name: "Strawberry Shortcake",
description: "Fluffy biscuit layered with fresh strawberries and whipped cream",
imagePath: "lib/assets/images/pexels-sittisak-c-842235-1739347.jpg",
price: 5.99,
category: FoodCategories.desert,
availableAddons: [
Addon(name: "Add a Scoop of Vanilla Ice Cream", price: 2.00),
Addon(name: "Extra Whipped Cream", price: 1.25),
Addon(name: "Drizzle of Strawberry Sauce", price: 1.50)
]
),

// drinks
// drinks
Food(
name: "Iced Tea",
description: "Freshly brewed black iced tea, served with lemon wedge",
imagePath: "lib/assets/images/pexels-valeriya-1200348.jpg",
price: 2.49,
category: FoodCategories.drinks,
availableAddons: [
Addon(name: "Sweetener Packets", price: 0.25),
Addon(name: "Extra Lemon Wedges", price: 0.50),
Addon(name: "Flavor Shot (Peach, Mango, etc.)", price: 0.75)
]
),

Food(
name: "Lemonade",
description: "Homemade lemonade, made with fresh lemon juice, sugar, and water",
imagePath: "lib/assets/images/pexels-isabella-mendes-107313-338713.jpg",
price: 2.99,
category: FoodCategories.drinks,
availableAddons: [
Addon(name: "Strawberry Puree", price: 1.00),
Addon(name: "Mint Leaves", price: 0.50),
Addon(name: "Refill", price: 1.50)
]
),

Food(
name: "Bottled Water",
description: "Chilled bottled spring water",
imagePath: "lib/assets/images/pexels-mariapop-342971.jpg",
price: 1.99,
category: FoodCategories.drinks,
availableAddons: [
Addon(name: "Sparkling Water", price: 0.75),
Addon(name: "Flavor Enhancer (Lemon, Lime, etc.)", price: 0.50)
]
),

Food(
name: "Fountain Soda",
description: "Choice of Coke, Diet Coke, Sprite, or Fanta, served over ice",
imagePath: "lib/assets/images/pexels-fox-58267-1217325.jpg",
price: 2.25,
category: FoodCategories.drinks,
availableAddons: [
Addon(name: "Refill", price: 1.00),
Addon(name: "Add Flavor Shot", price: 0.75)
]
),

Food(
name: "Smoothie",
description: "Choice of strawberry, banana, or mixed berry, blended with yogurt and ice",
imagePath: "lib/assets/images/pexels-donghuangmingde-2207964.jpg",
price: 4.99,
category: FoodCategories.drinks,
availableAddons: [
Addon(name: "Add Protein Powder", price: 1.50),
Addon(name: "Substitute Almond Milk", price: 0.75),
Addon(name: "Extra Fruit", price: 1.00)
]
),






 ];
    

/*
GETTERS 

*/

List<Food> get menu => _menu;


/*


O P E R A T I O N S 

*/


  // user cart
 final  List<CartItem> _cart = [];

 
 void addToCart(Food food, List<Addon> selectedAddons) {
  // Check if the same food item with the same addons already exists in the cart
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    return item.food == food && const ListEquality().equals(item.selectedAddons, selectedAddons);
  });

  if (cartItem != null) {
    // Increment the quantity of the existing cart item
    cartItem.quantity++;
  } else {
    // Create a new cart item and add it to the cart
    CartItem newCartItem = CartItem(food: food, selectedAddons: selectedAddons, quantity: 1);
    _cart.add(newCartItem);
  }
}




// remove from cart
void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);
  if (cartIndex != -1) {
    if (cartItem.quantity > 1) {
      // Decrement the quantity of the existing cart item
      cartItem.quantity--;
    } else {
      // Remove the cart item from the list
      _cart.removeAt(cartIndex);
    }
  }
}





// get total price  to cart
 double getTotalPrice() {
  double total = 0.0;

  for (CartItem cartItem  in _cart) {
    double itemTotal = cartItem.food.price;

    for (Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }
    total += itemTotal + cartItem.quantity;
  }
  return total;
 }






// get total number of items in cart 






// clear cart 












/*


HELPERS


*/


// generate receipt 





// format double Value into Money 



// format list of addons into a string summary








}