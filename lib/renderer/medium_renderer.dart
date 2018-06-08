import 'package:flutter/material.dart';
import 'package:flutter_feed/feed/medium_tile.dart';

class MediumRenderer {
  MediumRenderer();

  Widget render(List data) {
    return ListView(
      children: data.map((post) => MediumTile(post)).toList(),
    );
  }
}
