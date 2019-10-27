import 'package:flutter/material.dart';
import 'package:flutter_template/service/service_configurer.dart';
import 'package:meta/meta.dart';

/// Any properties required for the application for different builds should be defined
/// in this class. They can be configured by setting the property in the corresponding
/// main_{profile}.dart file.
///
/// Retrieval of these properties can be done at any point via
/// `AppConfig.of(context)`, since this widget wraps the entire running app.
class AppConfig extends InheritedWidget {
  AppConfig(
      {@required this.appName,
      @required this.title,
      @required this.debug,
      @required this.primaryColor,
      @required this.accentColor,
      @required this.lightTextColor,
      @required this.darkTextColor,
      @required this.secondaryTextColor,
      @required this.gameplay,
      @required this.tokenIcon,
      @required Widget child})
      : super(child: child);

  final String appName;
  final String title;
  final bool debug;
  final MaterialColor primaryColor;
  final MaterialAccentColor accentColor;
  final Color lightTextColor;
  final Color darkTextColor;
  final Color secondaryTextColor;
  final IconData tokenIcon;
  final GameplayConfig gameplay;

  static bool _configured = false;

  static AppConfig of(BuildContext context) {
    if (!_configured) {
      _configured = true;
      initialize(context);
    }
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  static initialize(BuildContext context) {
    ServiceConfigurer.configure(context);
  }

  // Our app configuration will not change, so no need to notify ever.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class GameplayConfig {
  GameplayConfig({
    @required this.historyCount,
    @required this.doors,
  });

  final int historyCount;
  final int doors;
}
