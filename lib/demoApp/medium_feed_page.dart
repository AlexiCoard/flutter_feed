import 'package:flutter/material.dart';
import 'package:flutter_feed/demoApp/feed_drawer.dart';
import 'package:flutter_feed/feed/medium_feed.dart';

class MediumFeedPage extends StatefulWidget {
  MediumFeedPage();

  @override
  _MediumFeedPageState createState() => _MediumFeedPageState();
}

class _MediumFeedPageState extends State<MediumFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medium feed"),
      ),
      drawer: FeedDrawer(),
      body: Center(
        child: MediumFeedWidget(),
      ),
    );
  }
}
