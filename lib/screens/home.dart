import 'package:fruit_order/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:fruit_order/screens/log_in.dart';
import 'package:fruit_order/screens/name.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                    child: Image.asset('images/basket.png'),
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
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xfff27214D),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We deliver the best freshest fruit salad in town. Order a combo today!!!',
                    style: TextStyle(
                      color: Color(0xfff5D577E),
                      fontSize: 16,
                      height: 1.5, // Adjust line height as needed
                    ),
                  ),
                  SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button action here
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Loading()),
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
                            "Let's Continue",
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
