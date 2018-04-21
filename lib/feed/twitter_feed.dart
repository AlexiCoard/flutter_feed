import 'package:flutter_feed/collector/twitter_collector.dart';
import 'package:flutter_feed/renderer/twitter_renderer.dart';
import 'package:flutter/material.dart';

class TwitterFeedWidget extends StatefulWidget {
  TwitterFeedWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TwitterFeedWidgetState createState() => new _TwitterFeedWidgetState();
}

class _TwitterFeedWidgetState extends State<TwitterFeedWidget> {
  List data;

  @override
  initState() {
    super.initState();

    var collector = new TwitterCollector();

    collector.gather().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return new Center(
            child: new CircularProgressIndicator(),
          );
    } else {
      return new Center(
          child: new TwitterRenderer().render(data),
      );
    }
  }
}