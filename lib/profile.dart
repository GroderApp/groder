import 'package:flutter/material.dart';
import 'package:groder/past_order.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Container(
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          child: Drawer(
            elevation: 0,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                ListTile(
                  title: new Text(
                    "Privacy",
                    style: TextStyle(fontSize: 17),
                  ),
                  leading: new Icon(
                    Icons.privacy_tip_outlined,
                    color: GroderColors.green,
                    size: 28,
                  ),
                ),
                ListTile(
                  title: new Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: new Icon(
                    Icons.person_outlined,
                    color: GroderColors.green,
                    size: 28,
                  ),
                ),
                ListTile(
                  title: new Text(
                    "View TOS",
                    style: TextStyle(fontSize: 17),
                  ),
                  leading: new Icon(
                    Icons.help_outline,
                    color: GroderColors.green,
                    size: 28,
                  ),
                ),
                GestureDetector(
                  child: ListTile(
                    title: new Text(
                      "Log out",
                      style: TextStyle(fontSize: 17),
                    ),
                    leading: new Icon(
                      Icons.logout_outlined,
                      color: GroderColors.green,
                      size: 28,
                    ),
                  ),
                  onTap: () {
                    context.read<AuthenticationService>().signOut();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
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
                        icon: Icon(
                          Icons.chat_bubble_outline,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
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
            ],
          ),
        ),
      ),
    );
  }
}
