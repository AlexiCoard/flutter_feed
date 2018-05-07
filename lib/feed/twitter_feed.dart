import 'package:flutter_feed/collector/twitter_collector.dart';
import 'package:flutter_feed/renderer/twitter_renderer.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TwitterFeedWidget extends StatefulWidget {
  TwitterFeedWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TwitterFeedWidgetState createState() => _TwitterFeedWidgetState();
}

class _TwitterFeedWidgetState extends State<TwitterFeedWidget> {
  List tweets;

  Future<Null> _gatherTweets() async {
    var collector = TwitterCollector.fromFile("config.yaml");
    await collector.getConfigCredentials().then((success) {
      collector.gather().then((response) {
        setState(() {
          tweets = response;
        });
      });
    });

    return null;
  }

  @override
  initState() {
    super.initState();
    _gatherTweets();
  }

  @override
  Widget build(BuildContext context) {
    if (tweets == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: RefreshIndicator(
          child: TwitterRenderer().render(tweets),
          onRefresh: () => _gatherTweets()
        ),
      );
    }
  }
}
