import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssn_qos/screens/main_menu.dart';

class textfieldinput extends StatelessWidget {
  var hinttext;
  var textInputType;
  var textEditingController;
  textfieldinput({super.key, required this.hinttext, required this.textInputType, required this.textEditingController});
  final _formKey = GlobalKey<FormState>();
@override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textEditingController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (EmailValidator.validate(value)!=true){
                return 'Invalid';

              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  }
}

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailconroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _emailconroller.dispose();
    _passwordcontroller.dispose();
  }

  void navigatetosignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  home_screeen()));
  }

  void loginuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await auth_methods().loginuser(
        email: _emailconroller.text, password: _passwordcontroller.text);
    if (res == 'Success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FeedScreen()));
    } 
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                'assests/images/search_icon.png',
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            textfieldinput(
              hinttext: 'Emailaddress',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailconroller,
            ),
            const SizedBox(
              height: 24,
            ),
            textfieldinput(
              hinttext: 'Password',
              textInputType: TextInputType.text,
              textEditingController: _passwordcontroller,
              ispass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: loginuser,
              child: Container(
                child: _isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: navigatetosignup,
                  child: Container(
                      child: const Text("  Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      padding: const EdgeInsets.symmetric(vertical: 8.0)),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
