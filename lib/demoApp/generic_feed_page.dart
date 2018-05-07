import 'package:flutter/material.dart';
import 'package:flutter_feed/demoApp/feed_drawer.dart';
import 'package:flutter_feed/feed/generic_feed.dart';
import 'package:flutter_feed/renderer/abstract_renderer.dart';
import 'package:flutter_feed/collector/abstract_collector.dart';

class GenericFeedPage extends StatefulWidget {
  GenericFeedPage();

  @override
  _GenericFeedPageState createState() => _GenericFeedPageState();
}

class _GenericFeedPageState extends State<GenericFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generic feed"),
      ),
      drawer: FeedDrawer(),
      body: Center(
        child: GenericFeed(ExampleCollector(), ExampleRenderer()),
      ),
    );
  }
}
