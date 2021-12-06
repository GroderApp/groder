import 'package:flutter/material.dart';
import 'package:groder/end_drawer.dart';
import 'package:groder/past_order.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class PastOrderData {
  String img;
  String store;
  String date;
  String location;
  List<String> people;
  List<String> categories;
  PastOrderData(this.store, this.date, this.location, this.people,
      this.categories, this.img);
}

List<PastOrderData> publixOrders = [
  PastOrderData(
      "Publix",
      "11/27/21",
      "950 W Peachtree St NW",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Publix",
      "11/26/21",
      "950 W Peachtree St NW",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Publix",
      "11/25/21",
      "950 W Peachtree St NW",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Publix",
      "11/24/21",
      "950 W Peachtree St NW",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
];

List<PastOrderData> costcoOrders = [
  PastOrderData(
      "Costco",
      "11/27/21",
      "500 Brookhaven Ave",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Costco",
      "11/26/21",
      "500 Brookhaven Ave",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Costco",
      "11/25/21",
      "500 Brookhaven Ave",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Costco",
      "11/24/21",
      "500 Brookhaven Ave",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
];

List<PastOrderData> walmartOrders = [
  PastOrderData(
      "Walmart",
      "11/27/21",
      "1801 Howell Mill Rd NW",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Walmart",
      "11/26/21",
      "1801 Howell Mill Rd NW",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Walmart",
      "11/25/21",
      "1801 Howell Mill Rd NW",
      [
        "lib/assets/profile2.jpg",
        "lib/assets/profile3.jpeg",
        "lib/assets/profile4.jpeg",
        "lib/assets/profile5.jpg"
      ],
      ["Home", "Kitchen", "Meals"],
      "lib/assets/profile.jpeg"),
  PastOrderData(
      "Walmart",
      "11/24/21",
      "1801 Howell Mill Rd NW",
      [
        "lib/assets/profile6.jpg",
        "lib/assets/profile7.jpg",
        "lib/assets/profile8.jpeg",
        "lib/assets/profile9.jpg"
      ],
      ["Furniture", "Entertainment", "Food"],
      "lib/assets/profile.jpeg"),
];

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: const EndDrawer(),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
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
                  width: 120,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          Icons.settings_outlined,
                          size: 30,
                        ),
                        onPressed: () {
                          _key.currentState!.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Center(
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
                            const SizedBox(height: 5),
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
                            const SizedBox(height: 5),
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
                          bottom: TabBar(
                              labelColor: GroderColors.black,
                              tabs: const [
                                Tab(child: Text("Publix")),
                                Tab(child: Text("Costco")),
                                Tab(child: Text("Walmart")),
                              ]),
                        )),
                    Expanded(
                        child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: publixOrders.length,
                                itemBuilder: (context, idx) {
                                  return PastOrder(data: publixOrders[idx]);
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: costcoOrders.length,
                                itemBuilder: (context, idx) {
                                  return PastOrder(data: costcoOrders[idx]);
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: walmartOrders.length,
                                itemBuilder: (context, idx) {
                                  return PastOrder(data: walmartOrders[idx]);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
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
