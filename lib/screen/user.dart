import "package:flutter/material.dart";
import "../widgets/user_list.dart";
import "../widgets/title.dart";

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _userInfos = [
      {"title": "Email", "subtitle": "Email sub", "index": 0},
      {"title": "Phone Number", "subtitle": "4555", "index": 1},
      {"title": "Shipping Address", "subtitle": "", "index": 2},
      {"title": "Joined Date", "subtitle": "Date", "index": 3},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextTitle(text: "User Information"),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ..._userInfos.map(
            (userinfo) {
              return UsersList(
                title: userinfo["title"] as String,
                subtitle: userinfo["subtitle"] as String,
                index: userinfo["index"] as int,
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
