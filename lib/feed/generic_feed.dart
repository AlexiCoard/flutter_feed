import 'package:flutter/material.dart';
import 'package:flutter_feed/collector/abstract_collector.dart';
import 'package:flutter_feed/renderer/abstract_renderer.dart';
import 'dart:async';

///
/// The Generic Feed widget can be used when you don't now a strong logic
/// inside your feed.
///
/// Basically you need to implement two things
///  - A collector which extends AbstractCollector with a gather method that will return
///    the data (it must return a Future)
///  - A renderer which extends AbstractRenderer with a render method that will build
///    the widget you want given you data . It can be a ListView, a Column, whatever you want
///
/// The GenericFeed object will handle all the refreshing, async calls and dirty stuff
/// If you want some more complex behaviour in your feed you can have a look at the Twitter one
///

class GenericFeed extends StatefulWidget {
  GenericFeed(AbstractCollector collector, AbstractRenderer renderer) {
    this.collector = collector;
    this.renderer = renderer;
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
