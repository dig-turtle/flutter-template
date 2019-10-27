import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_config.dart';
import 'game/doorz_level.dart';
import 'history/history.dart';
import 'menu/hamburger_menu.dart';

class DoorzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: config.primaryColor,
        primaryTextTheme: TextTheme(
            display1: TextStyle(color: config.lightTextColor),
            body1: TextStyle(color: config.lightTextColor)),
        primaryIconTheme:
            IconThemeData().copyWith(color: config.lightTextColor),
        accentIconTheme: IconThemeData().copyWith(color: config.lightTextColor),
      ),
      home: MyHomePage(title: config.title),
      debugShowCheckedModeBanner: config.debug,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _alarmButton(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('You pressed the alarm button!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DoorzDrawer.from(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _homeScreenButton(
                context,
                FontAwesomeIcons.award,
                'High Scores',
                (context) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()))),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DoorzLevel()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Builder _homeScreenButton(BuildContext context, IconData icon, String text,
      Function(BuildContext) onPressed) {
    return Builder(
      builder: (context) => Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.25),
          child: FlatButton(
            textColor: AppConfig.of(context).lightTextColor,
            child: Container(
              child: Row(children: <Widget>[
                Icon(icon),
                Spacer(flex: 1),
                Text(text),
                Spacer(flex: 2)
              ]),
              margin: EdgeInsets.all(15.0),
            ),
            onPressed: () => onPressed(context),
            color: AppConfig.of(context).accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          )),
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    var textTheme = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: AppConfig.of(context).lightTextColor);
    return BottomAppBar(
      color: AppConfig.of(context).accentColor,
      child: Container(
          padding: EdgeInsets.only(top: 6.0),
          child: Row(
            children: <Widget>[
              Spacer(),
              Icon(AppConfig.of(context).tokenIcon,
                  color: AppConfig.of(context).lightTextColor),
              Spacer(),
              Text('Tokens: ', style: textTheme),
              Text('1', style: textTheme),
              Spacer(flex: 3)
            ],
          )),
      shape: AutomaticNotchedShape(
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(1.0))),
    );
  }
}
