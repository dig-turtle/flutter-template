import 'package:flutter/material.dart';
import 'package:flutter_template/app_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoorzDrawer {
  static Drawer from(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: allMenuItems(context, <MenuItem>[
            MenuItem(FontAwesomeIcons.playCircle, 'Start'),
            MenuItem(FontAwesomeIcons.questionCircle, 'Help'),
            MenuItem(Icons.info_outline, 'About Us'),
            MenuItem(FontAwesomeIcons.cogs, 'Settings'),
          ])),
    );
  }

  static List<Widget> allMenuItems(
      BuildContext context, List<MenuItem> menuItems) {
    var widgets = <Widget>[];
    widgets.add(menuHeader(context));
    menuItems.forEach((item) => widgets.add(ListTile(
          leading: Icon(item.icon),
          title: Text(
            item.text,
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16.0),
          ),
        )));
    return widgets;
  }

  static DrawerHeader menuHeader(BuildContext context) {
    var config = AppConfig.of(context);
    return DrawerHeader(
      child: Align(
          alignment: Alignment.bottomRight,
          child: ListTile(
            leading: Icon(Icons.code),
            title: Text(
              'Menu',
              style: Theme.of(context)
                  .primaryTextTheme
                  .display3
                  .copyWith(color: config.lightTextColor),
              textAlign: TextAlign.left,
            ),
          )),
      decoration: BoxDecoration(color: config.accentColor),
    );
  }
}

class MenuItem {
  MenuItem(
    this.icon,
    this.text,
  );

  final IconData icon;
  final String text;
}
