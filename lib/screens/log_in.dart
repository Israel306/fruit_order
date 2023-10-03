import 'package:flutter/material.dart';
import 'package:fruit_order/screens/reset.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fruit_order/screens/sign_up.dart';
import 'package:fruit_order/screens/log_in.dart';
//import 'package:fruit_order/screens/reset.dart';
import 'package:fruit_order/auth_controller.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Checkbox
  bool _isChecked = false;
  // Password visibility
  bool _isObscure = true;

  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  // Future signIn() async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //     password: _passwordController.text.trim(),
  //   );
  // }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:  Colors.orangeAccent,
        elevation: 10,
        // Display the end drawer when this icon is pressed
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.email,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility, // Call the toggle function
                          child: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                              checkColor: Colors.white,
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(() => Reset());
                            print('forgot password ?');
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 20,
                        thickness: 1,
                        color: Color(0xffE3E8F1),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('or with',
                        style: TextStyle(
                            color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 20,
                        thickness: 1,
                        color: Color(0xffE3E8F1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xffE3E8F1),
                          width: 1.0,
                        ),
                      ),
                      child: Image(
                        image: AssetImage('images/google.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xffE3E8F1),
                          width: 1.0,
                        ),
                      ),
                      child: Image(
                        image: AssetImage('images/fb.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
// Add your button press logic here.
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.orange
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => SignUp());
// Add your button press logic here.
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
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
    );
  }
}