import 'abstract_collector.dart';
import 'package:twitter/twitter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;

class TwitterCollector implements AbstractCollector {
  String _consumerKey;
  String _consumerSecret;
  String _accessToken;
  String _accessTokenSecret;
  String _filename;
  String _query;

  TwitterCollector.fromFile(String configFileName, String query) {
    this._filename = configFileName;
    this._query = query;
  }

  TwitterCollector(String _consumerKey, String _consumerSecret,
      String _accessToken, String _accessTokenSecret, String query) {
    this._consumerKey = _consumerKey;
    this._consumerSecret = _consumerSecret;
    this._accessToken = _accessToken;
    this._accessTokenSecret = _accessTokenSecret;
    this._query = query;
  }

  Future getConfigCredentials() async {
    String data = await rootBundle.loadString(this._filename);
    Map config = loadYaml(data)['twitterFeed'];
    this._consumerKey = config['consumerKey'];
    this._consumerSecret = config['consumerSecret'];
    this._accessToken = config['accessToken'];
    this._accessTokenSecret = config['accessTokenSecret'];

    return true;
  }

  Future gather() async {
    Map keymap = {
      "consumerKey": this._consumerKey,
      "consumerSecret": this._consumerSecret,
      "accessToken": this._accessToken,
      "accessSecret": this._accessTokenSecret,
    };

    Twitter twitter = new Twitter.fromMap(keymap);
    var response = await twitter.request("GET", this._query);

    return json.decode(response.body);
  }
}
