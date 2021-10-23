import 'package:flutter/material.dart';
import 'package:groder/past_order.dart';
import 'package:groder/shared/groder_colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                        width: 100,
                        height: 25,
                        child: Center(
                          child: Text(
                            "97 A+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GroderColors.black,
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
                  Spacer(),
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
                        width: 100,
                        height: 25,
                        child: Center(
                          child: Text(
                            "105",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GroderColors.black,
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
              const PastOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
