import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterTile extends StatefulWidget {
  TwitterTile(Map<String, dynamic> tweet) : this.tweet = tweet;

  final Map<String, dynamic> tweet;

  @override
  _TwitterTileState createState() => _TwitterTileState();
}

class _TwitterTileState extends State<TwitterTile> {
  @override
  Widget build(BuildContext context) {
    print(widget.tweet.runtimeType);
    return ListTile(
      title: Text(widget.tweet["user"]["name"]),
      subtitle: Column(
        children: <Widget>[
          Text(widget.tweet["text"]),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(children: <Widget>[
                Text("${widget.tweet['retweet_count']}"),
                //TODO : use this when Flutter will support svg new Image.asset("assets/retweet.svg"),
                Icon(Icons.autorenew),
              ]),
              Row(
                children: <Widget>[
                  Text("${widget.tweet['favorite_count']}"),
                  Icon(Icons.favorite_border),
                ],
              ),
            ],
          ),
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.tweet["user"]["profile_image_url_https"]),
      ),

      isThreeLine: true,
      onTap: () => _launchTwitterURL(widget.tweet["id_str"]),
    );
  }
}

_launchTwitterURL(String tweetId) async {
  var fullURL = 'https://twitter.com/statuses/$tweetId';

  if (await canLaunch(fullURL)) {
    await launch(fullURL);
  } else {
    throw 'Could not launch $fullURL';
  }
}
