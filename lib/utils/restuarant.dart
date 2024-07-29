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
  Food(
name: "Caesar Salad",
description: "Fresh romaine lettuce, grilled chicken, croutons, and homemade Caesar dressing",
imagePath: "lib/assets/images/caesar_salad.jpg",
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
imagePath: "lib/assets/images/greek_salad.jpg",
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
imagePath: "lib/assets/images/cobb_salad.jpg",
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
imagePath: "lib/assets/images/spinach_salad.jpg",
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
imagePath: "lib/assets/images/fruit_salad.jpg",
price: 6.99,
category: FoodCategories.salads,
availableAddons: [
Addon(name: "Add Grilled Chicken", price: 2.50),
Addon(name: "Sprinkle of Granola", price: 1.00),
Addon(name: "Upgrade to All Organic Fruit", price: 2.00)
]
),

// desserts
Food(
name: "Chocolate Lava Cake",
description: "Warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream",
imagePath: "lib/assets/images/chocolate_lava_cake.jpg",
price: 7.99,
category: FoodCategories.desserts,
availableAddons: [
Addon(name: "Add Caramel Sauce", price: 1.50),
Addon(name: "Upgrade to Salted Caramel Ice Cream", price: 2.00),
Addon(name: "Extra Scoop of Ice Cream", price: 2.50)
]
),

Food(
name: "Classic Cheesecake",
description: "Creamy New York-style cheesecake with a graham cracker crust, topped with fresh strawberries",
imagePath: "lib/assets/images/cheesecake.jpg",
price: 6.99,
category: FoodCategories.desserts,
availableAddons: [
Addon(name: "Add Chocolate Sauce", price: 1.25),
Addon(name: "Substitute Blueberry Topping", price: 1.50),
Addon(name: "Whipped Cream", price: 1.00)
]
),

Food(
name: "Triple Chocolate Ice Cream",
description: "Rich and creamy chocolate ice cream with chunks of chocolate and chocolate sauce swirled throughout",
imagePath: "lib/assets/images/chocolate_ice_cream.jpg",
price: 4.99,
category: FoodCategories.desserts,
availableAddons: [
Addon(name: "Add Chocolate Sprinkles", price: 0.75),
Addon(name: "Upgrade to a Double Scoop", price: 2.00),
Addon(name: "Whipped Cream and Cherry", price: 1.50)
]
),

Food(
name: "Tiramisu",
description: "Layers of coffee-soaked ladyfingers, mascarpone cream, and cocoa powder",
imagePath: "lib/assets/images/tiramisu.jpg",
price: 6.49,
category: FoodCategories.desserts,
availableAddons: [
Addon(name: "Add a Splash of Amaretto", price: 2.00),
Addon(name: "Extra Dusting of Cocoa", price: 1.00),
Addon(name: "Serve with Espresso", price: 2.50)
]
),

Food(
name: "Strawberry Shortcake",
description: "Fluffy biscuit layered with fresh strawberries and whipped cream",
imagePath: "lib/assets/images/strawberry_shortcake.jpg",
price: 5.99,
category: FoodCategories.desserts,
availableAddons: [
Addon(name: "Add a Scoop of Vanilla Ice Cream", price: 2.00),
Addon(name: "Extra Whipped Cream", price: 1.25),
Addon(name: "Drizzle of Strawberry Sauce", price: 1.50)
]
),





 ];





}