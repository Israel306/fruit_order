import 'package:flutter/material.dart';
import 'package:fruit_order/model/cart_model.dart';

class Description extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final Color color;
  final onTap;

  Description({
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.onTap,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange.shade800,
                ),
                child: Image.asset(itemPath, fit:BoxFit.cover),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
