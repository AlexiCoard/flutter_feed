import 'package:flutter/material.dart';

abstract class AbstractFeed {
  build() {
    var children = new List<Widget>();

    children.add(new Text("Override me !"));

    ListView lv = new ListView(
      children: children,
    );

    return lv;
  }
}
