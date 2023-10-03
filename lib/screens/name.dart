import 'package:flutter/material.dart';
import 'package:fruit_order/screens/ordering.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 550,
              width: double.infinity,
              color: Colors.orange,
              child: Stack(
                children: [
                  Positioned(
                    top: 120,
                    right: 0,
                    left: 0,
                    child: Image.asset('images/basket2.png'),
                  ),
                  Positioned(
                    top: 120,
                    right: 50,
                    child: Image.asset('images/fruit.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is your firstname',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xfff27214D),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200], // Grey background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius
                        borderSide: BorderSide.none, // Remove the default border
                      ),
                      hintText: 'Enter name', // Placeholder text
                      hintStyle: TextStyle(color: Colors.grey[500]), // Placeholder text color
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final enteredName = nameController.text;
                            // Handle button action here
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ordering(enteredName: enteredName)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.orangeAccent,
                            shadowColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Start Ordering",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
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
