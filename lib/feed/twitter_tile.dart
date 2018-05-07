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
    return InkWell(
      child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: new Color.fromRGBO(230, 236, 240, 1.0))),
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.tweet["user"]["profile_image_url_https"]),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        //Tweet heading
                        children: <Widget>[
                          Text(
                            "${widget.tweet['user']['name']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "@${widget.tweet['user']['screen_name']}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: tweetContent,
                            ),
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
                    ],
                  ),
                  flex: 5,
                )
              ],
            ),
          )),
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
