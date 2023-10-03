import 'package:fruit_order/screens/log_in.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fruit_order/screens/home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector( // Wrap the entire body with GestureDetector
        onTap: () {
          // Navigate to the homepage when any part of the screen is tapped
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LogIn(),
          ));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network('https://lottie.host/b6306ae9-992d-42ec-9240-1b5245a2da5a/mv3rIT2IBm.json'),
              SizedBox(height: 20), // Adjust the spacing as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Click Me', // Add your text/icon here
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.orange,
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

