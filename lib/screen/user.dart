// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ecommerceapp/Colors/color.dart';
import "package:flutter/material.dart";
import "../widgets/build_fb.dart";
import 'package:list_tile_switch/list_tile_switch.dart';
import "../widgets/user_list.dart";
import "../widgets/title.dart";

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;
  ScrollController? _scrollController;
  var top = 0.0;

  final _userInfos = [
    {"title": "Email", "subtitle": "Email sub", "index": 0},
    {"title": "Phone Number", "subtitle": "4555", "index": 1},
    {"title": "Shipping Address", "subtitle": "", "index": 2},
    {"title": "Joined Date", "subtitle": "Date", "index": 3},
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsConsts.starterColor,
                          ColorsConsts.endColor
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: top <= 110.0 ? 1.0 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      background: const Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextTitle(
                        text: "User Informaion",
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
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
                    ),
                    // to remove
                    const SizedBox(
                      height: 500,
                    )
                  ],
                ),
              ),
            ],
          ),
          BuildFb(
            scrollController: _scrollController as ScrollController,
          ),
        ],
      ),
    );
  }
}
