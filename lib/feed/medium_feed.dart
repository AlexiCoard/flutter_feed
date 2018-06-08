import 'package:flutter_feed/collector/medium_collector.dart';
import 'package:flutter_feed/renderer/medium_renderer.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MediumFeedWidget extends StatefulWidget {
  MediumFeedWidget({this.query : '/users/160bc6fc8eec6fbf94b91d79a19f74bc97b204a51cd15b9ec97a2f5a639101fb0/publications'});

  final String query;

  @override
  _MediumFeedWidgetState createState() => _MediumFeedWidgetState();
}

class _MediumFeedWidgetState extends State<MediumFeedWidget> {
  List posts;

  Future<Null> _gatherPosts() async {
    var collector = MediumCollector.fromFile("config.yaml", widget.query);
    await collector.getConfigCredentials().then((success) {
      collector.gather().then((response) {
        setState(() {
          posts = response;
        });
      });
    });

    return null;
  }

  @override
  initState() {
    super.initState();
    _gatherPosts();
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: RefreshIndicator(
            child: MediumRenderer().render(posts),
            onRefresh: () => _gatherPosts()),
      );
    }
  }
}
