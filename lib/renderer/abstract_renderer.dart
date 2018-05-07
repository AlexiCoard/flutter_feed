import 'package:flutter/material.dart';

///
/// The Abstract Renderer widget is basically an abstract class to implement if
/// you want to use the GenericFeed widget.
///
/// You need to implement the render method, which returns a Widget generated from
/// your data, it can be a ListView, a Column, a GridView... whatever you want
///
abstract class AbstractRenderer {
  AbstractRenderer();

  Widget render(List data) {
    return ListView(
      children: data
          .map((element) => ListTile(
                title: Text(element.toString()),
              ))
          .toList(),
    );
  }
}

class ExampleRenderer extends AbstractRenderer {
  Widget render (List data) {
    return super.render(data);
  }
}