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
    List<Widget> tweetContent = [
      Text(widget.tweet['text']),
    ];

    //If tweet contains images, add them
    if (widget.tweet["entities"].containsKey("media")) {
      var tweetImages = widget.tweet["entities"]["media"];
      var numberOfImagePerRow =
          tweetImages.length <= 3 ? tweetImages.length : 2;
      List<Widget> images = List<Widget>();
      tweetImages.forEach(
          (image) => images.add(Image.network(image['media_url_https'])));
      tweetContent.add(Container(
        height: 150.0,
        child: GridView.count(
          crossAxisCount: numberOfImagePerRow,
          children: images,
        ),
      ));
    }

    return ListTile(
      title: Text(widget.tweet["user"]["name"]),
      subtitle: Column(
        children: <Widget>[
          Column(
            children: tweetContent,
          ),
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
