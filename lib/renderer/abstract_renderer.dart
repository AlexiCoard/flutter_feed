import 'package:flutter/material.dart';

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