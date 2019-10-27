import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/game/gameover.dart';
import 'package:flutter_template/history/history_service.dart';
import 'package:flutter_template/service/service_configurer.dart';

import '../app_config.dart';
import 'doorz_level.dart';

class DoorzLevelService extends ConfigurableService {
  DoorzLevelService._internal();

  static final DoorzLevelService _singleton = DoorzLevelService._internal();

  int level = 1;

  factory DoorzLevelService() {
    return _singleton;
  }

  final _historyService = HistoryService();

  /// NOT functionally pure. Each invocation of this function
  /// will return a new random DoorzLevelParameters object with a new correct door.
  DoorzLevelParameters params(BuildContext context) {
    return DoorzLevelParameters(AppConfig.of(context));
  }

  /// This will either return a new DoorzLevel, meaning the user correctly
  /// picked the right door, or else it will return the gameover screen.
  Widget nextScreen(DoorzLevelParameters params, int selection) {
    Widget next = params.correctDoor(selection) ? _advance() : _gameover();
    return next;
  }

  DoorzLevel _advance() {
    level++;
    return DoorzLevel();
  }

  Gameover _gameover() {
    _historyService.writeHistory(level);
    level = 1;
    return Gameover();
  }

  @override
  configure(BuildContext context) {
    // TODO: Things that need the context / app config do that here.
  }
}

class DoorzLevelParameters {
  var random = Random.secure();

  int _correctDoor;

  DoorzLevelParameters(AppConfig config) {
    this._correctDoor = random.nextInt(config.gameplay.doors);
  }

  bool correctDoor(int selected) {
    return selected == _correctDoor;
  }
}
