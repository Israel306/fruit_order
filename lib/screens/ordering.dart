import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fruit_order/model/cart_model.dart';
import 'package:fruit_order/screens/description.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../auth_controller.dart';
import '../utilis/groceryitem.dart';
import 'cartpage.dart';
import '../utilis/selectimage.dart';

class Ordering extends StatefulWidget {
  final String enteredName;
  const Ordering({Key? key, required this.enteredName}) : super(key: key);

  @override
  State<Ordering> createState() => _OrderingState();
}

class _OrderingState extends State<Ordering> {

  Uint8List? _image;

  late String enteredName; // Declare a variable to store enteredName
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    enteredName = widget.enteredName; // Initialize enteredName in initState
  }

  final TextEditingController searchController = TextEditingController();

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu, // Replace with your desired icon
                      color: Color(0xfff070648), // Icon color
                      size: 30.0, // Icon size
                    ),
                    onPressed: () {
                      // Handle the icon click here
                      // You can navigate to another screen or perform any action you want.
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart, // Replace with your desired icon
                          color: Colors.orange, // Icon color
                          size: 30.0, // Icon size
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CartPage();
                              },
                            ), // You can navigate to another screen or perform any action you want.
                          );
                        },
                      ),
                      Text(
                        'My basket',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello $enteredName, ',
                      style: TextStyle(
                        color: Color(0xfff070648),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'What fruit salad',
                      style: TextStyle(
                        color: Color(0xfff070648),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                  'combo do you want today',
                style: TextStyle(
                  color: Color(0xfff070648),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200], // Grey background color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0), // Border radius
                          borderSide: BorderSide.none, // Remove the default border
                        ),
                        hintText: 'Search for fruit salad combos', // Placeholder text
                        hintStyle: TextStyle(color: Colors.grey[500]), // Placeholder text color
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.sync_alt,
                    color: Color(0xfff070648),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recommended Combo',
                style: TextStyle(
                  color: Color(0xfff070648),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: Consumer<CartModel>(
                    builder: (context, value, child){
                      return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          childAspectRatio: 1/1.4,
                        ),
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                    itemName: value.shopItems[index][0],
                                    itemPrice: value.shopItems[index][1],
                                    itemPath: value.shopItems[index][2],
                                    color: value.shopItems[index][3],
                                    onTap: (){
                                      Provider.of<CartModel>(context, listen: false).addItemFromToCart(index);
                                    }
                                  ),
                              ),
                            ),
                            child: GroceryItemTile(
                              itemName: value.shopItems[index][0],
                              itemPrice: value.shopItems[index][1],
                              itemPath: value.shopItems[index][2],
                              color: value.shopItems[index][3],
                              onTap: () {
                                // Handle the tap action here
                                Provider.of<CartModel>(context, listen: false).addItemFromToCart(index);
                                // Show a dialog or navigate to a new screen if needed
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Successfully added!'),
                                    content: Text('View your cart'),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Stack(
                  children: [
                    _image != null ?
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                    :
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/avatar.png'),
                    ),
                    Positioned(
                        child: IconButton(
                            onPressed: selectImage,
                            icon: Icon(Icons.add_a_photo_outlined),
                        ),
                      bottom: -10,
                      left: 80,
                    ),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Divider(
                color: Colors.white70,
              ),
            ),
            ListTile(
              title: Text('Drawer Item 1'),
              onTap: () {
                // Handle item tap
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                    ),
                    onPressed: () {
                      AuthController.instance.logOut();
// Add your button press logic here.
                    },
                    child: Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
