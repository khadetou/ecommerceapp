import 'package:ecommerceapp/widgets/title.dart';
import 'package:ecommerceapp/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserColumn extends StatefulWidget {
  const UserColumn({Key? key}) : super(key: key);

  @override
  State<UserColumn> createState() => _UserColumnState();
}

class _UserColumnState extends State<UserColumn> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    var _userInfos = [
      {"title": "Email", "subtitle": "Email sub", "index": 0},
      {"title": "Phone Number", "subtitle": "4555", "index": 1},
      {"title": "Shipping Address", "subtitle": "", "index": 2},
      {"title": "Joined Date", "subtitle": "Date", "index": 3},
    ];
    return Column(
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextTitle(text: "User Settings"),
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        ListTileSwitch(
          value: _value,
          leading: const Icon(Ionicons.ios_moon),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: Colors.indigo,
          title: const Text("Dark Theme"),
        ),
        const UsersList(
          title: "Log out",
          subtitle: "",
          index: 3,
        )
      ],
    );
  }
}
