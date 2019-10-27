import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/service/service_configurer.dart';
import 'package:path_provider/path_provider.dart';

import '../app_config.dart';

class HistoryService extends ConfigurableService {
  HistoryService._internal();

  static final HistoryService _singleton = HistoryService._internal();

  int historyItems = 10;

  factory HistoryService() {
    return _singleton;
  }

  @override
  configure(BuildContext context) {
    historyItems = AppConfig.of(context).gameplay.historyCount;
  }

  List<int> history = <int>[];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/history.txt');
  }

  Future<List<int>> readHistory() async {
    if (this.history.isEmpty) {
      // read the storage file if it's an empty list or else just return it.
      try {
        final file = await _localFile;

        // Read the file
        String contents = await file.readAsString();

        this.history =
            contents.split(',').map((String value) => int.parse(value));
      } catch (e) {
        // If encountering an error, return an empty list
        print(e);
        this.history = <int>[];
      }
    }
    return this.history;
  }

  Future<File> writeHistory(int history) async {
    this.history.add(history);
    this.history.sort((a, b) => b.compareTo(a));
    this.history = this.history.take(historyItems).toList();
    final file = await _localFile;
    // Write the file
    return file.writeAsString(this.history.join(','));
  }
}
