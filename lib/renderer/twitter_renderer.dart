import 'package:flutter/material.dart';

class TwitterRenderer {

  TwitterRenderer();

  Widget render (List data) {

    List<Widget> renderedWidgets = new List<Widget>();

    data.forEach((element) {
      print('rendering a list item');
      print(element);
      print(element["user"]);
      renderedWidgets.add(new ListTile(
        title: new Text(element["user"]["name"]),
        subtitle: new Text(element["text"]),
        leading: new Image.network(element["user"]["profile_image_url_https"]),
        isThreeLine: true,
      ));
    });
    var lv = new ListView(
      children: renderedWidgets,
    );
    return lv;
  }
}