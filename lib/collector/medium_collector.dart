import 'abstract_collector.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;

class MediumCollector implements AbstractCollector {
  final apiHost = 'https://api.medium.com/v1';
  String _bearer;
  String _query;
  String _configFileName;

  MediumCollector.fromFile(String configFileName, String query) {
    this._configFileName = configFileName;
    this._query = query;
  }

  MediumCollector(String _bearer, String query) {
    this._bearer = _bearer;
    this._query = query;
  }

  Future getConfigCredentials() async {
    String data = await rootBundle.loadString(this._configFileName);
    Map config = loadYaml(data)['medium'];
    this._bearer = config['bearer'];

    return true;
  }

  Future gather() async {
    var url = apiHost + this._query;

    // call the web server asynchronously
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.AUTHORIZATION: "Bearer " + this._bearer,
        HttpHeaders.CONTENT_TYPE: 'application/json',
        HttpHeaders.ACCEPT: 'application/json',
        HttpHeaders.ACCEPT_CHARSET: 'utf-8',
      },
    );

    return json.decode(response.body)['data'];
  }
}
