import 'package:flutter/material.dart';
import 'package:flutter_feed/feed/twitter_tile.dart';

class TwitterRenderer {
  TwitterRenderer();

  Widget render(List data) {
    return ListView(
      children: data.map((tweet) => TwitterTile(tweet)).toList(),
    );
  }
}
