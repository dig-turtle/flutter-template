import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_config.dart';
import 'doorz_level_service.dart';

class DoorzLevel extends StatefulWidget {
  @override
  State<DoorzLevel> createState() => _DoorzLevelState();
}

class _DoorzLevelState extends State<DoorzLevel> {
  DoorzLevelService levelService = DoorzLevelService();

  @override
  Widget build(BuildContext context) {
    DoorzLevelParameters params = levelService.params(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Level ' + levelService.level.toString()),
      ),
      body: Center(
        child: Row(
          children: doors(context, params),
        ),
      ),
    );
  }

  List<Widget> doors(BuildContext context, DoorzLevelParameters params) {
    AppConfig config = AppConfig.of(context);
    final doors = config.gameplay.doors;

    List<Widget> doorWidgets = <Widget>[Spacer(flex: 1)];

    for (int i = 0; i < doors; i++) {
      doorWidgets.add(DoorzButton(params: params, index: i));
      doorWidgets.add(Spacer(
        flex: 1,
      ));
    }

    return doorWidgets;
  }
}

class DoorzButton extends StatelessWidget {
  DoorzButton({
    @required this.params,
    @required this.index,
  });

  final DoorzLevelParameters params;
  final int index;

  final DoorzLevelService levelService = DoorzLevelService();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => levelService.nextScreen(params, index))),
      child: Icon(
        FontAwesomeIcons.doorClosed,
      ),
    );
  }
}
