import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groder/chat_users_model.dart';
import 'package:groder/conversation_list.dart';
import 'package:groder/shared/groder_colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
  ChatUsers(name: "Kriss Benwat", messageText: "Awesome Setup", imageURL: "lib/assets/profile.jpeg", time: "Now"),
  ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "lib/assets/profile2.jpg", time: "Yesterday"),
  ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "lib/assets/profile3.jpeg", time: "31 Mar"),
  ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "lib/assets/profile4.jpeg", time: "28 Mar"),
  ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "lib/assets/profile5.jpg", time: "23 Mar"),
  ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "lib/assets/profile6.jpg", time: "17 Mar"),
  ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "lib/assets/profile7.jpg", time: "24 Feb"),
  ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "lib/assets/profile8.jpeg", time: "18 Feb"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Conversations",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 0,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: GroderColors.lightGreen,
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 5),
                          Icon(Icons.add,color: GroderColors.green,size: 20,),
                          SizedBox(width: 2,),
                          Text("New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          SizedBox(width: 5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }}