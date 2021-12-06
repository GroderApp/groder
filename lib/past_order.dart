import 'package:flutter/material.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:groder/profile.dart';

class PastOrder extends StatelessWidget {
  PastOrderData data;
  PastOrder({required this.data, Key? key}) : super(key: key);

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

  String store = "";
  String img = "";
  String location = "";
  String date = "";
  List<String> categories = [];
  List<String> people = [];

  @override
  Widget build(BuildContext context) {
    store = data.store;
    location = data.location;
    categories = data.categories;
    date = data.date;
    people = data.people;
    img = data.img;

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
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(img),
                  radius: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      store,
                      style: const TextStyle(
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
                const Spacer(),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      location,
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
                        categories.length >= 1
                            ? groceryCategoryTag(categories[0])
                            : Container(),
                        categories.length >= 2
                            ? groceryCategoryTag(categories[1])
                            : Container(),
                        categories.length >= 3
                            ? groceryCategoryTag(categories[2])
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
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
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(Icons.expand_more),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    people.isNotEmpty
                        ? Container(
                            margin:
                                EdgeInsets.fromLTRB(0, 0, (45).toDouble(), 0),
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: AssetImage(people[0]),
                            ),
                          )
                        : Container(),
                    people.length >= 2
                        ? Container(
                            margin:
                                EdgeInsets.fromLTRB(0, 0, (30).toDouble(), 0),
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: AssetImage(people[1]),
                            ),
                          )
                        : Container(),
                    people.length >= 3
                        ? Container(
                            margin:
                                EdgeInsets.fromLTRB(0, 0, (15).toDouble(), 0),
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: AssetImage(people[2]),
                            ),
                          )
                        : Container(),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: GroderColors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Center(
                        child: Text(
                          "+" +
                              (people.length - 3 >= 0 ? people.length - 3 : 0)
                                  .toString(),
                        ),
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
