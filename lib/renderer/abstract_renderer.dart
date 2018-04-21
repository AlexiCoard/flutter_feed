import 'package:flutter/material.dart';

abstract class AbstractRenderer {
  AbstractRenderer();

  Widget render(dynamic data) {
    List<Widget> renderedWidgets = new List<Widget>();

    data.forEach((element) {
      renderedWidgets.add(new ListTile(
        title: new Text(element.toString()),
      ));
    });
    var lv = new ListView(
      children: renderedWidgets,
    );
    return lv;
  }
}
