import 'package:flutter/material.dart';
import 'package:groder/past_order.dart';
import 'package:groder/shared/groder_colors.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("lib/assets/profile.jpeg"),
                radius: 65,
              ),
              Text(
                "John Hull",
                style: TextStyle(
                  fontSize: 34,
                  color: GroderColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "@johnchull",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: GroderColors.grey,
                    ),
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                      color: GroderColors.grey,
                    ),
                  ),
                  Text(
                    "3.4 mi",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: GroderColors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      Text(
                        "grode",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: GroderColors.black,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: 125,
                        height: 25,
                        child: Center(
                          child: Text(
                            "97 A+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GroderColors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: GroderColors.green,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "deliveries",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: GroderColors.black,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: 125,
                        height: 25,
                        child: Center(
                          child: Text(
                            "105",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GroderColors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: GroderColors.green,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 50,
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white12,
                    bottom: TabBar(labelColor: GroderColors.black, tabs: const [
                      Tab(child: Text("Publix")),
                      Tab(child: Text("Costco")),
                      Tab(child: Text("Wawa")),
                    ]),
                  )),
              Expanded(
                  child: TabBarView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: const [
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: const [
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                        PastOrder(),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
