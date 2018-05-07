import 'package:flutter/material.dart';
import 'package:flutter_feed/demoApp/feed_drawer.dart';
import 'package:flutter_feed/feed/twitter_feed.dart';

class TwitterFeedPage extends StatefulWidget {
  TwitterFeedPage();

  @override
  _TwitterFeedPageState createState() => _TwitterFeedPageState();
}

class _TwitterFeedPageState extends State<TwitterFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter feed"),
      ),
      drawer: FeedDrawer(),
      body: Center(
        child: TwitterFeedWidget(),
      ),
    );
  }
}
