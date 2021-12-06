import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groder/authScreens/sign_up.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:groder/shared/custom_dialog_box.dart';
import 'package:groder/shared/groder_colors.dart';
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
  bool loading = false;
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
                  height: 100,
                ),
                Text(
                  "login",
                  style: TextStyle(
                    color: GroderColors.green,
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 50),
                loading ? SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: new CircularProgressIndicator(
                    color: GroderColors.green,
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ) : SizedBox(height : 50),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: GroderColors.lightGreen,
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

                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, color: GroderColors.green),
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
                    color: GroderColors.lightGreen,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    obscureText: obscurePassword,
                    onChanged: (value) {
                      password = value;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "password",
                      icon: Icon(
                        Icons.lock,
                        color: GroderColors.green,
                      ),
                      suffix: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                        color: GroderColors.grey,
                        onPressed: () {
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
                      color: GroderColors.green,
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        String toReturn = await context.read<AuthenticationService>().signIn(email, password);
                        setState(() {
                          loading = false;
                        });
                        if(toReturn == "worked") {
                          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                        } else {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Error signing in",
                                  descriptions: toReturn,
                                  text: "Ok",
                                );
                              }
                          );
                        }
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
                      style: TextStyle(color: GroderColors.darkGrey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return SignUp();
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: GroderColors.darkGrey,
                          decoration: TextDecoration.underline,
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
