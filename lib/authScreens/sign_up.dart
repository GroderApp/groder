import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groder/authScreens/sign_up.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:groder/shared/custom_dialog_box.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscurePassword = true;
  bool obscurePasswordRetype = true;
  final formKey = GlobalKey<FormState>();
  String password = '';
  String retypePassword = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String username = '';
  String location = '';
  String phoneNumber = '';

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
                  "sign up",
                  style: TextStyle(
                    color: GroderColors.green,
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                loading ? SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: new CircularProgressIndicator(
                    color: GroderColors.green,
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ) : SizedBox(height : 40),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: GroderColors.lightGreen,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      firstName = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter first name";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "first name",
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
                    onChanged: (value) {
                      lastName = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter last name";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "last name",
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
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter email";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
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
                    onChanged: (value) {
                      username = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter username";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "username",
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
                    onChanged: (value) {
                      location = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter location";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "location",
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
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    validator: (val) {
                      if (val == null) return "Please enter phone number";
                      return null;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "phone number",
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: GroderColors.lightGreen,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    obscureText: obscurePasswordRetype,
                    onChanged: (value) {
                      retypePassword = value;
                    },
                    cursorColor: GroderColors.darkGrey,
                    decoration: InputDecoration(
                      hintText: "retype password",
                      suffix: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: obscurePasswordRetype ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                        color: GroderColors.grey,
                        onPressed: () {
                          setState(() {
                            obscurePasswordRetype = !obscurePasswordRetype;
                          });
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        if (firstName == "" || lastName == "" || username == "" || phoneNumber == "" || location == "") {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Error signing up",
                                  descriptions: "Please fill out all fields before proceeding",
                                  text: "Ok",
                                );
                              }
                          );
                        } else if (password.length < 6) {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Error signing up",
                                  descriptions: "The passwords must be greater than 6 characters long",
                                  text: "Ok",
                                );
                              }
                          );
                        } else if (password != retypePassword) {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Error signing up",
                                  descriptions: "The passwords must be identical",
                                  text: "Ok",
                                );
                              }
                          );
                        } else {
                          setState(() {
                            loading = true;
                          });
                          String toReturn = await context.read<AuthenticationService>().signUp(email, password, firstName, lastName, username, location, phoneNumber);
                          setState(() {
                            loading = false;
                          });
                          if(toReturn == "worked") {
                            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                          } else {
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return CustomDialogBox(
                                    title: "Error signing up",
                                    descriptions: toReturn,
                                    text: "Ok",
                                  );
                                }
                            );
                          }
                        }
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
