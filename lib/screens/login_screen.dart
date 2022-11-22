import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssn_qos/screens/signup_screen.dart';
import 'package:ssn_qos/services/utils.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    navigatorKey:
    navigatorKey;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(
                        'assets/images/left_top_x.svg',
                        color: Colors.blue,
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'Welcome to',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 60),
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'AI One',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 60),
                      )),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.blueAccent),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(),
                            controller: nameController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.blue,
                                      strokeAlign: StrokeAlign.center)),
                              labelText: 'Email ID',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            style: TextStyle(),
                            cursorColor: primaryColor,
                            obscureText: !_passwordVisible,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 3)),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 82, 33, 243)),
                            ),
                            TextButton(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 53, 193, 232)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SafeArea(
                                            top: true, child: SignUpScreen())));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future SignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: nameController.text.trim(),
          password: passwordController.text.trim());
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.rightSlide,
      //   title: 'Login Succesful',
      //   btnOkOnPress: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) =>
      //                 SafeArea(top: true, child: home_screeen())));
      //   },
      // )..show();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Utils.showSnackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Utils.showSnackBar('Wrong password provided for that user.');
      }
    }
  }
}
