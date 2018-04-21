import 'abstract_collector.dart';
import 'package:twitter/twitter.dart';
import 'dart:async';
import 'dart:convert';

class TwitterCollector implements AbstractCollector {

  //TODO use env var or config file
  String consumerKey = "foo";
  String consumerSecret = "bar";
  String accessToken = "footoken";
  String accessTokenSecret = "foosecret";

  TwitterCollector();

  Future gather() async {
    Map keymap = {
      "consumerKey": this.consumerKey,
      "consumerSecret": this.consumerSecret,
      "accessToken": this.accessToken,
      "accessSecret": this.accessTokenSecret,
    };
    Twitter twitter = new Twitter.fromMap(keymap);
    var response = await twitter.request("GET", "statuses/user_timeline.json");

    return JSON.decode(response.body);
  }
}
