import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.index,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int index;
  @override
  Widget build(BuildContext context) {
    List<IconData> _userTileIcons = [
      Icons.email,
      Icons.phone,
      Icons.local_shipping,
      Icons.exit_to_app_rounded
    ];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }
}
