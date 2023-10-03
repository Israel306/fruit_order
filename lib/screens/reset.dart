import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fruit_order/screens/sign_up.dart';
import 'package:fruit_order/screens/log_in.dart';
import 'package:fruit_order/auth_controller.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  var emailController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.orangeAccent,
            appBar: AppBar(
              title: Text('Reset your Password'),
              backgroundColor:  Colors.orangeAccent,
              elevation: 10,
              // Display the end drawer when this icon is pressed
            ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    style: TextStyle(
                        fontSize: 16
                    ),
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Email ID',
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            AuthController.instance.Passwordreset(emailController.text.trim());
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

