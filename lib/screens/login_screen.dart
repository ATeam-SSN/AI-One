import 'package:flutter/material.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  height: 60,
                  width: 60,
                  child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset('assets/images/left_top_x.svg'))),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'AI One',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 60),
                  )),
              Container(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 15)
                      ],
                      color: Color.fromARGB(255, 84, 72, 221),
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 30),
                          )),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(color: primaryColor),
                          controller: nameController,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor)),
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          style: TextStyle(color: primaryColor),
                          cursorColor: primaryColor,
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor)),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'Forgot Password',
                        ),
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              if (nameController.text != null &&
                                  passwordController.text != null) {
                                SignIn();
                              } else {}
                            },
                          )),
                      Row(
                        children: <Widget>[
                          const Text(
                            'Does not have account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 53, 193, 232)),
                            ),
                            onPressed: () {},
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim());
  }
}
