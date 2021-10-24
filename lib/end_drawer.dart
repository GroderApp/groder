import 'package:flutter/material.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:provider/provider.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
