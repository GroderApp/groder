import 'dart:math';

import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/scaled_tile.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:groder/profile.dart';

import 'shared/groder_colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class Post {
  final String name;
  final String location;
  final double distance;

  Post(this.name, this.location, this.distance);
}

class _SearchState extends State<Search> {
  final SearchBarController<Post> _searchBarController = SearchBarController();

  bool toggle = false;
  String inputtext = "";

  List<Post> posts = [
    Post("John Hull", "Publix", 3.4),
    Post("Drew Jones", "Walmart", 2.8),
    Post("Joseph Donald", "Sams", 1.9),
    Post("Cali Francis", "Sams", 3.7),
    Post("Sarah Johnson", "Publix", 1.4),
    Post("Bill Joe", "Walmart", 1.6),
  ];

  Future<List<Post>> _getAllPosts(String? text) async {
    await Future.delayed(Duration(seconds: text!.length == 4 ? 10 : 1));
    inputtext = text;
    if (!toggle) {
      posts.sort((a, b) => a.distance.compareTo(b.distance));
      posts.sort(
          (a, b) => a.location.compareTo(text) - b.location.compareTo(text));
    } else {
      posts.sort((a, b) => a.distance.compareTo(b.distance));
      posts.sort((a, b) => a.name.compareTo(text) - b.name.compareTo(text));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    posts.sort((a, b) => a.distance.compareTo(b.distance));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
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
              child: SearchBar<Post>(
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
                                color: GroderColors.lightGreen,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ListTile(
                                title: Text(posts[index].name),
                                isThreeLine: true,
                                subtitle: Text("Currently at " +
                                    posts[index].location +
                                    " | Lives " +
                                    posts[index].distance.toString() +
                                    " mi away"),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detail()));
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
                  children: <Widget>[
                    TextButton(
                      child: Text("Location"),
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                        });
                        if (toggle)
                          _searchBarController.sortList((a, b) =>
                              a.name.compareTo(inputtext) -
                              b.name.compareTo(inputtext));
                        else
                          _searchBarController.sortList((a, b) =>
                              a.location.compareTo(inputtext) -
                              b.location.compareTo(inputtext));
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        backgroundColor: !toggle
                            ? MaterialStateProperty.all<Color>(
                                GroderColors.green)
                            : MaterialStateProperty.all<Color>(
                                GroderColors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      child: Text("Name"),
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                        });
                        if (toggle)
                          _searchBarController.sortList((a, b) =>
                              a.name.compareTo(inputtext) -
                              b.name.compareTo(inputtext));
                        else
                          _searchBarController.sortList((a, b) =>
                              a.location.compareTo(inputtext) -
                              b.location.compareTo(inputtext));
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        backgroundColor: toggle
                            ? MaterialStateProperty.all<Color>(
                                GroderColors.green)
                            : MaterialStateProperty.all<Color>(
                                GroderColors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  ],
                ),
                onCancelled: () {
                  setState(() {
                    toggle = false;
                  });
                },
                searchBarStyle: SearchBarStyle(
                  backgroundColor: GroderColors.lightGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                crossAxisCount: 1,
                onItemFound: (Post? post, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: GroderColors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      title: Text(post!.name),
                      isThreeLine: true,
                      subtitle: Text("Currently at " +
                          post.location +
                          " | Lives " +
                          post.distance.toString() +
                          " mi away"),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Detail()));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
