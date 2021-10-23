import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groder/authScreens/sign_up.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscurePassword = true;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String password = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 180,
                ),
                Text(
                  "login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 160),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (val) {
                      if (val == null) return null;
                      return null;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.green),
                      hintText: "email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    obscureText: obscurePassword,
                    onChanged: (value) {
                      password = value;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      suffix: InkWell(
                        child: Icon(
                          obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.green,
                        ),
                        onTap: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Colors.lightGreen,
                      onPressed: () {
                        print("hello");
                        context.read<AuthenticationService>().signIn(email, password);
                        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don’t have an Account? ",
                      style: TextStyle(color: Colors.lightGreen),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
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
