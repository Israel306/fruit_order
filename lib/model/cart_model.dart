import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Honey Lime Combo", "2000", "images/Honey-Lime.png", Colors.white],
    ["Berry Mango Combo", "8000", "images/Glowing-Berry.png", Colors.white],
    ["Berry Mango Combo", "10000", "images/Quinoa.png", Colors.white],
    ["Berry Mango Combo", "10000", "images/Tropical.png", Colors.white],
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add items to cart

  void addItemFromToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromToCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  // calculate total price item
  String calculateTotal() {
    double totalPrice = 0;
    for (int i=0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}