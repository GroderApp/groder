import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groder/search.dart';
import 'package:groder/shared/groder_colors.dart';

class OrderFulfillment extends StatefulWidget {
  GroderProfile profile;
  OrderFulfillment({required this.profile, Key? key}) : super(key: key);

  @override
  _OrderFulfillmentState createState() => _OrderFulfillmentState();
}

class _OrderFulfillmentState extends State<OrderFulfillment> {
  final _textController = TextEditingController();
  List<String> orders = [];
  List<String> prices = [];
  double sum = 0;
  int len = 0;
  FocusNode myFocusNode = FocusNode();

  String asset = "";
  String name = "";
  double distance = 0.0;
  String location = "";
  String username = "";
  String grodeGrade = "A+";
  int grode = 0;
  int deliveries = 0;

  @override
  void initState() {
    super.initState();
    asset = widget.profile.asset;
    location = widget.profile.location;
    name = widget.profile.name;
    distance = widget.profile.distance;
    username = widget.profile.username;
    grode = widget.profile.grode;
    if (grode >= 97) {
      grodeGrade = "A+";
    } else if (grode >= 93) {
      grodeGrade = "A";
    } else if (grode >= 90) {
      grodeGrade = "A-";
    } else if (grode >= 87) {
      grodeGrade = "B+";
    } else if (grode >= 83) {
      grodeGrade = "B";
    } else if (grode >= 80) {
      grodeGrade = "B-";
    } else if (grode >= 77) {
      grodeGrade = "C+";
    } else if (grode >= 73) {
      grodeGrade = "C";
    } else if (grode >= 70) {
      grodeGrade = "C-";
    } else if (grode >= 67) {
      grodeGrade = "D+";
    } else if (grode >= 63) {
      grodeGrade = "D";
    } else if (grode >= 60) {
      grodeGrade = "D-";
    } else {
      grodeGrade = "F";
    }

    deliveries = widget.profile.deliveries;
  }

  Widget orderTag(String order, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0.0, 25.0, 0.0),
      child: InkWell(
        onTap: () {},
        child: Chip(
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.5),
          backgroundColor: GroderColors.lightGreen,
          label: Center(
            child: Text(
              order + " (" + prices[index] + ")",
              style: TextStyle(
                color: GroderColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          deleteIcon: const Icon(
            Icons.close,
            size: 12,
          ),
          onDeleted: () {
            setState(() {
              sum -= double.parse(prices[index].substring(1));
              len = orders.length - 1;
              orders.removeAt(index);
              prices.removeAt(index);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 80,
                child: IconButton(
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 130,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(asset),
                              radius: 65,
                            ),
                          ),
                          // Align(
                          // alignment: Alignment.bottomRight,
                          //   child: CircleAvatar(
                          //     radius: 21,
                          //     backgroundColor: GroderColors.black,
                          //     child: CircleAvatar(
                          //       radius: 20,
                          //       backgroundColor: GroderColors.lightGreen,
                          //       child: Center(
                          //         child: Text(
                          //           "5",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 24,
                          //             color: GroderColors.black,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    name,
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
                        "@$username",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: GroderColors.grey,
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                          fontSize: 14,
                          color: GroderColors.grey,
                        ),
                      ),
                      Text(
                        "$distance mi",
                        style: TextStyle(
                          fontSize: 14,
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
                          SizedBox(height: 5),
                          Container(
                            width: 125,
                            height: 25,
                            child: Center(
                              child: Text(
                                "$grode $grodeGrade",
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
                          SizedBox(height: 5),
                          Container(
                            width: 125,
                            height: 25,
                            child: Center(
                              child: Text(
                                "$deliveries",
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                    child: TextField(
                      controller: _textController,
                      cursorColor: GroderColors.green,
                      onSubmitted: (temp) {
                        if (temp.length == 0) return;
                        setState(() {
                          orders.add(temp);
                          prices.add("\$" +
                              (5 * Random().nextDouble()).toStringAsFixed(2));
                          len = prices.length;
                          sum += double.parse(
                              prices[prices.length - 1].substring(1));
                          _textController.clear();
                          myFocusNode.requestFocus();
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        hintText: 'Enter an item',
                      ),
                      focusNode: myFocusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (_textController.text.length == 0) return;
                              setState(() {
                                prices.add("\$" +
                                    (5 * Random().nextDouble())
                                        .toStringAsFixed(2));
                                orders.add(_textController.text);
                                len = prices.length;
                                sum += double.parse(
                                    prices[prices.length - 1].substring(1));
                                _textController.clear();
                                myFocusNode.requestFocus();
                              });
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: GroderColors.white,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(GroderColors.green),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: orders.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return orderTag(orders[index], index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 1,
                      color: GroderColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Price: \$" + sum.abs().toStringAsFixed(2)),
                      Text("Items: " + len.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Order",
                              style: TextStyle(
                                color: GroderColors.white,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(GroderColors.green),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
