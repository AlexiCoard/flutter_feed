import 'package:flutter/material.dart';
import 'package:flutter_feed/collector/abstract_collector.dart';
import 'package:flutter_feed/renderer/abstract_renderer.dart';
import 'dart:async';

class GenericFeed extends StatefulWidget {
  GenericFeed(AbstractCollector collector, AbstractRenderer render) {
    this.collector = collector;
  }

  AbstractCollector collector;
  AbstractRenderer renderer;

  @override
  _GenericFeedState createState() => _GenericFeedState();
}

class _GenericFeedState extends State<GenericFeed> {

  List data;

  Future<Null> _gatherData() async {
    widget.collector.gather().then((response) {
      setState(() {
        data = response;
      });
    });

    return null;
  }

  @override
  initState() {
    super.initState();
    _gatherData();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: RefreshIndicator(
            child: widget.renderer.render(data),
            onRefresh: () => _gatherData()),
      );
    }
  }
}
