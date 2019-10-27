import 'package:flutter/material.dart';
import 'package:flutter_template/main_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_config.dart';

void main() {
  var configuredApp = new AppConfig(
      appName: 'Doorz Dev',
      title: 'Doorz Dev',
      debug: true,
      primaryColor: Colors.deepOrange,
      accentColor: Colors.deepOrangeAccent,
      lightTextColor: Colors.white,
      darkTextColor: Colors.black,
      secondaryTextColor: Colors.blueGrey,
      tokenIcon: FontAwesomeIcons.megaport,
      gameplay: GameplayConfig(
        historyCount: 10,
        doors: 2,
      ),
      child: new DoorzApp());

  runApp(configuredApp);
}
