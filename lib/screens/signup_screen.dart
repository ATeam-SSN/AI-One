import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:ssn_qos/screens/login_screen.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssn_qos/services/utils.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// GlobalKey<FormState> formKey = GlobalKey<FormState>();
var dropdownvalue = "BTech IT";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

enum SingingCharacter { A, B }

SingingCharacter? _section = SingingCharacter.A;

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> departments = [
      "BTech IT",
      "BE ECE",
      "BE CSE",
      "BE EEE",
      "Others"
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
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
                    child: Row(
                      children: [
                        Text(
                          'New to ',
                          style: AppThemes().RegisterStyle1,
                        ),
                        Text(
                          'AI One',
                          style: AppThemes().RegisterStyle3,
                        ),
                        Text(
                          '?',
                          style: AppThemes().RegisterStyle1,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Start by filling up these details',
                      style: AppThemes().RegisterStyle2,
                    )),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(),
                          controller: nameController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.blue,
                                    strokeAlign: StrokeAlign.center)),
                            labelText: 'Username',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? "Invalid email"
                                  : null,
                          style: TextStyle(),
                          cursorColor: primaryColor,
                          controller: emailController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3)),
                            labelText: 'Email ID',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value == null || value.length < 6
                                  ? "Enter atleast 6 characters"
                                  : null,
                          // style: TextStyle(),
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
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(10),
                            child: DropdownButton(
                              focusNode: FocusNode(),
                              dropdownColor: Colors.blueAccent,
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: departments.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(
                                            color: Colors.blueAccent,
                                            width: 3)),
                                    child: Center(
                                        child: Text(items,
                                            selectionColor: Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                          Text(
                            "Section   A",
                            style: AppThemes().small,
                          ),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.A,
                            groupValue: _section,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                print(value);
                                _section = value;
                              });
                            },
                          ),
                          Text(
                            "    B",
                            style: AppThemes().small,
                          ),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.B,
                            groupValue: _section,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                print(value);
                                _section = value;
                              });
                            },
                          )
                        ],
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_forward_outlined),
                                Text(
                                  '  Sign Up',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              //   print("Details successfully entered");
                              // }
                              if (emailController.text != null &&
                                  passwordController.text != null) {
                                SignUp();
                              } else {}
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 82, 33, 243)),
                          ),
                          TextButton(
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 53, 193, 232)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SafeArea(
                                          top: true, child: LoginScreen())));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future SignUp() async {
    try {
      print(emailController.text);
      print(passwordController.text);
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.toString().trim(),
              password: passwordController.toString().trim());
      print(emailController.text);
      // ignore: avoid_single_cascade_in_expression_statements
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Registration Succesful',
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SafeArea(top: true, child: LoginScreen())));
        },
      )..show();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
