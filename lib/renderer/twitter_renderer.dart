import 'package:flutter/material.dart';

class TwitterRenderer {

  TwitterRenderer();

  Widget render (List data) {

    return new ListView(
      children: data
          .map((tweet) => new ListTile(
        title: new Text(tweet["user"]["name"]),
        subtitle: new Text(tweet["text"]),
        leading: new Image.network(
            tweet["user"]["profile_image_url_https"]),
        isThreeLine: true,
      ))
          .toList(),
    );
  }
}