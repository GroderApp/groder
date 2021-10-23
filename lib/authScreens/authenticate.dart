import 'package:flutter/material.dart';
import 'package:groder/authScreens/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool loginTapped = false;
  bool registerTapped = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Text(
                    "Groder",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 70,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 160),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedCrossFade(
                          firstChild: GestureDetector(
                            onTap: () {
                              setState(() {
                                loginTapped = !loginTapped;
                                registerTapped = false;
                              });
                            },
                            child: AnimatedContainer(
                              height: 50,
                              width: 350,
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  border: loginTapped
                                      ? null
                                      : Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: loginTapped
                                      ? Colors.lightGreen
                                      : Colors.black),
                              child: Center(
                                child: Text(
                                  "login",
                                  style: TextStyle(
                                      color: loginTapped
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                          secondChild: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    loginTapped = !loginTapped;
                                    registerTapped = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  height: 50,
                                  width: 350,
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      border: loginTapped
                                          ? null
                                          : Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: loginTapped
                                          ? Colors.lightGreen
                                          : Colors.black),
                                  child: Center(
                                    child: Text(
                                      "login",
                                      style: TextStyle(
                                          color: loginTapped
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with email",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with google",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with apple",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          crossFadeState: loginTapped
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: Duration(milliseconds: 300),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AnimatedCrossFade(
                          firstChild: GestureDetector(
                            onTap: () {
                              setState(() {
                                registerTapped = !registerTapped;
                                loginTapped = false;
                              });
                            },
                            child: AnimatedContainer(
                              height: 50,
                              width: 350,
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  border: registerTapped
                                      ? null
                                      : Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: registerTapped
                                      ? Colors.lightGreen
                                      : Colors.black),
                              child: Center(
                                child: Text(
                                  "register",
                                  style: TextStyle(
                                      color: registerTapped
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                          secondChild: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    registerTapped = !registerTapped;
                                    loginTapped = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  height: 50,
                                  width: 350,
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      border: registerTapped
                                          ? null
                                          : Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: registerTapped
                                          ? Colors.lightGreen
                                          : Colors.black),
                                  child: Center(
                                    child: Text(
                                      "register",
                                      style: TextStyle(
                                          color: registerTapped
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with email",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with google",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "with apple",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          crossFadeState: registerTapped
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "By registering, you hereby agree to our\nTerms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
