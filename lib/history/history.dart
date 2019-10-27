import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'history_service.dart';

class History extends StatelessWidget {
  final HistoryService _historyService = HistoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: FutureBuilder(
        future: history(),
        initialData: <String>[],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return createListView(context, snapshot);
        },
      )),
    );
  }

  Future<List<String>> history() async {
    return _historyService
        .readHistory()
        .then((values) => values.map((value) => value.toString()).toList());
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
