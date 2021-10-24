import 'package:flutter/material.dart';
import 'package:groder/shared/groder_colors.dart';

class PastOrder extends StatelessWidget {
  const PastOrder({Key? key}) : super(key: key);

  Widget groceryCategoryTag(String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0.0, 5.0, 0.0),
      child: InkWell(
        onTap: () {},
        child: Chip(
          backgroundColor: GroderColors.green,
          label: Text(
            name,
            style: TextStyle(
              color: GroderColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: GroderColors.lightGreen,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          // border: Border.all(
          //   color: GroderColors.blue,
          //   width: 2,
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("lib/assets/profile.jpeg"),
                  radius: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Publix",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.open_in_new,
                        color: GroderColors.green,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Spacer(),
                const Text(
                  "11/27/21",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "950 W Preachtree St NW",
                      style: TextStyle(
                        shadows: const [
                          Shadow(color: Colors.black, offset: Offset(0, -3))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: GroderColors.green,
                        decorationThickness: 2,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.map),
                      iconSize: 20,
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 7),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        groceryCategoryTag("Home"),
                        groceryCategoryTag("Kitchen"),
                        groceryCategoryTag("Meals"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: GroderColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(Icons.expand_more),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 45, 0),
                      child: const CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage("lib/assets/profile.jpeg"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: const CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage("lib/assets/profile.jpeg"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: const CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage("lib/assets/profile.jpeg"),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: GroderColors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: const Center(
                        child: Text("+5"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
