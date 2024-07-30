// food item

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategories category;
  List<Addon> availableAddons;
   
  Food({
  required this.name,
  required this.description,
  required this.imagePath,
  required this.price,
  required this.category,
  required this.availableAddons,
 });


}
  // Food categories
  enum FoodCategories {
    dish,
    salads,
    sides,
    desert,
    drinks,

  }


  // food addons 

  class Addon {
    String name;
    double price;

    Addon({

      required this.name,
      required this.price,
    });
  }





