import 'package:flutter/material.dart';

class GroceryItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final itemPath;
  final color;
  void Function()? onTap;

  GroceryItemTile({Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GroceryItemTile> createState() => _GroceryItemTileState();
}

class _GroceryItemTileState extends State<GroceryItemTile> {
  bool isFavorite = false;
 // Initial state is not active
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite; // Toggle the favorite state
                      });
                    },
                    child: Icon(
                      isFavorite
                          ? Icons.favorite // Filled heart icon when favorite
                          : Icons.favorite_border, // Empty heart icon when not favorite
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(widget.itemPath),
            // Other card content goes here
            Text(widget.itemName),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '#'+widget.itemPrice,
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                InkWell(
                  onTap: widget.onTap,
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.orange,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
