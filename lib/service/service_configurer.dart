import 'package:flutter/material.dart';
import 'package:flutter_template/game/doorz_level_service.dart';
import 'package:flutter_template/history/history_service.dart';

abstract class ConfigurableService {
  configure(BuildContext context);
}

class ServiceConfigurer {
  static configure(BuildContext context) {
    services()
        .forEach((ConfigurableService service) => service.configure(context));
  }

  static List<ConfigurableService> services() {
    return <ConfigurableService>[HistoryService(), DoorzLevelService()];
  }
}
