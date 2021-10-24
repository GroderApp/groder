import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groder/shared/groder_colors.dart';

class OrderFulfillment extends StatefulWidget {
  const OrderFulfillment({Key? key}) : super(key: key);

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
        child: Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 130,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("lib/assets/profile.jpeg"),
                          radius: 65,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: GroderColors.black,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: GroderColors.lightGreen,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: GroderColors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    "3.4 mi",
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
                      SizedBox(height: 5),
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
                      sum +=
                          double.parse(prices[prices.length - 1].substring(1));
                      _textController.clear();
                      myFocusNode.requestFocus();
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                                (5 * Random().nextDouble()).toStringAsFixed(2));
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  physics: ScrollPhysics(),
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
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 1,
                  color: GroderColors.black,
                ),
              ),
              SizedBox(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }
}
