import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';


class CartItem {
  late Food food;
  late List<Addon> selectedAddons;
  int quantity;



  CartItem({
    required this.food,
    required this.quantity,
    required this.selectedAddons
  });

  double get totalPrice {
    double addonsPrice = 
    selectedAddons.fold( 1, ( sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
