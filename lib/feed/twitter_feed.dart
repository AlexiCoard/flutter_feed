import 'package:flutter_feed/feed/abstract_feed.dart';
import 'package:flutter_feed/collector/twitter_collector.dart';
import 'package:flutter_feed/renderer/twitter_renderer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class TwitterFeed implements AbstractFeed {

  TwitterCollector collector;
  TwitterRenderer renderer;

  TwitterFeed() {
    this.collector = new TwitterCollector();
    this.renderer = new TwitterRenderer();
  }

   Future<Widget> build() async {

    var data = await this.collector.gather();
    data.then((response) {
        var tweets = JSON.decode(response);
        print(tweets.runtimeType.toString());
        return this.renderer.render(tweets);
    });
    data.catchError((error) {
      return new Text("Twitter is kaput'");
    });
  }
}