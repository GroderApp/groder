import 'dart:math';

import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/scaled_tile.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:groder/chat.dart';
import 'package:groder/end_drawer.dart';
import 'package:groder/profile.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:provider/provider.dart';

import 'order_fulfillment.dart';
import 'shared/groder_colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class GroderProfile {
  final String name;
  final String location;
  final double distance;
  final String asset;
  final String username;
  final int grode;
  final int deliveries;

  GroderProfile(this.name, this.location, this.distance, this.asset,
      this.username, this.grode, this.deliveries);
}

class _SearchState extends State<Search> {
  final SearchBarController<GroderProfile> _searchBarController =
      SearchBarController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool toggle = false;
  String inputtext = "";

  List<GroderProfile> posts = [
    GroderProfile("John Hull", "Publix", 3.4, "lib/assets/profile.jpeg",
        "johnhull", 97, 105),
    GroderProfile("Drew Jones", "Walmart", 2.8, "lib/assets/profile2.jpg",
        "drewjones", 89, 94),
    GroderProfile("Joseph Donald", "Sams", 1.9, "lib/assets/profile3.jpeg",
        "josephdonald", 93, 207),
    GroderProfile("Cali Francis", "Sams", 3.7, "lib/assets/profile4.jpeg",
        "califrancis", 99, 174),
    GroderProfile("Sarah Johnson", "Publix", 1.4, "lib/assets/profile5.jpg",
        "sarahjohnson", 83, 342),
    GroderProfile("Bill Joe", "Walmart", 1.6, "lib/assets/profile6.jpg",
        "billjoe", 91, 125),
    GroderProfile("Casey Junkin", "Costco", 7.9, "lib/assets/profile7.jpg",
        "caseyjunkin", 86, 32),
    GroderProfile("Eva Long", "Aldis", 4.7, "lib/assets/profile8.jpeg",
        "evalong", 69, 278),
    GroderProfile("Kali Watt", "HEB", 2.4, "lib/assets/profile9.jpg",
        "kaliwatt", 83, 476),
  ];

  Container getListTile(GroderProfile? post, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: GroderColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          post!.name,
          style: const TextStyle(
            fontSize: 19,
          ),
        ),
        isThreeLine: true,
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Currently at " + post.location),
            Text(post.distance.toString() + " mi away"),
          ],
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(post.asset),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderFulfillment(profile: post),
            ),
          );
        },
      ),
    );
  }

  Future<List<GroderProfile>> _getAllPosts(String? text) async {
    await Future.delayed(Duration(seconds: text!.length == 1 ? 3 : 1));
    inputtext = text;
    List<GroderProfile> posts2 = [];
    if (!toggle) {
      for (GroderProfile a in posts) {
        if (a.location.toLowerCase().contains(text.toLowerCase())) {
          posts2.add(a);
        }
      }
      posts2.sort((a, b) => a.distance.compareTo(b.distance));
    } else {
      for (GroderProfile a in posts) {
        if (a.name.toLowerCase().contains(text.toLowerCase())) {
          posts2.add(a);
        } else if (a.username.toLowerCase().contains(text.toLowerCase())) {
          posts2.add(a);
        }
      }
      posts2.sort((a, b) => a.distance.compareTo(b.distance));
    }
    return posts2;
  }

  @override
  Widget build(BuildContext context) {
    posts.sort((a, b) => a.distance.compareTo(b.distance));
    return Scaffold(
      key: _key,
      endDrawer: const EndDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              const SizedBox(
                width: 3,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                icon: const Icon(
                  Icons.person_outlined,
                  size: 30,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  _key.currentState!.openEndDrawer();
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
              ),
            ]),
            Center(
              child: Text(
                "Find your groder",
                style: TextStyle(
                  color: GroderColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 34,
                ),
              ),
            ),
            Expanded(
              child: SearchBar<GroderProfile>(
                loader: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: GroderColors.green,
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                ),
                searchBarPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                headerPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                listPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                onSearch: _getAllPosts,
                searchBarController: _searchBarController,
                placeHolder: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: GroderColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ListTile(
                                title: Text(
                                  posts[index].name,
                                  style: const TextStyle(
                                    fontSize: 19,
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Currently at " +
                                        posts[index].location),
                                    Text(posts[index].distance.toString() +
                                        " mi away"),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage(posts[index].asset),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => OrderFulfillment(
                                          profile: posts[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                cancellationWidget: const Text("Cancel"),
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: TextButton(
                          child: const Text("Location"),
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                            });
                            if (toggle) {
                              _searchBarController.sortList((a, b) =>
                                  a.name.compareTo(inputtext) -
                                  b.name.compareTo(inputtext));
                            } else {
                              _searchBarController.sortList((a, b) =>
                                  a.location.compareTo(inputtext) -
                                  b.location.compareTo(inputtext));
                            }
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(200, 35)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                            ),
                            backgroundColor: !toggle
                                ? MaterialStateProperty.all<Color>(
                                    GroderColors.lightGreen)
                                : MaterialStateProperty.all<Color>(
                                    GroderColors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: !toggle
                                      ? Colors.transparent
                                      : GroderColors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Center(
                        child: TextButton(
                          child: const Text("Name"),
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                            });
                            if (toggle) {
                              _searchBarController.sortList((a, b) =>
                                  a.name.compareTo(inputtext) -
                                  b.name.compareTo(inputtext));
                            } else {
                              _searchBarController.sortList((a, b) =>
                                  a.location.compareTo(inputtext) -
                                  b.location.compareTo(inputtext));
                            }
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(200, 35)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                            ),
                            backgroundColor: toggle
                                ? MaterialStateProperty.all<Color>(
                                    GroderColors.lightGreen)
                                : MaterialStateProperty.all<Color>(
                                    GroderColors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: toggle
                                      ? Colors.transparent
                                      : GroderColors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onCancelled: () {
                  setState(() {
                    toggle = false;
                  });
                },
                searchBarStyle: SearchBarStyle(
                  backgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                crossAxisCount: 1,
                onItemFound: (GroderProfile? post, int index) {
                  return getListTile(post, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
