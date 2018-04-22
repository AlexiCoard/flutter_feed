import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterRenderer {
  TwitterRenderer();

  _launchTwitterURL(String tweetId) async {
    var fullURL = 'https://twitter.com/statuses/$tweetId';

    if (await canLaunch(fullURL)) {
      await launch(fullURL);
    } else {
      throw 'Could not launch $fullURL';
    }
  }

  Widget render(List data) {
    return new ListView(
      children: data
          .map((tweet) => new ListTile(
                title: new Text(tweet["user"]["name"]),
                subtitle: new Text(tweet["text"]),
                leading:
                    new Image.network(tweet["user"]["profile_image_url_https"]),
                isThreeLine: true,
                onTap: () => _launchTwitterURL(tweet["id_str"]),
              ))
          .toList(),
    );
  }
}
