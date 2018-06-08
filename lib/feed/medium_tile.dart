import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MediumTile extends StatefulWidget {
  MediumTile(Map<String, dynamic> post) : this.post = post;

  final Map<String, dynamic> post;

  @override
  _MediumTileState createState() => _MediumTileState();
}

class _MediumTileState extends State<MediumTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Color.fromRGBO(230, 236, 240, 1.0))),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.post['imageUrl']),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.post['name']}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.post['description']}",
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  flex: 5,
                )
              ],
            ),
          )),
      onTap: () => _launchMediumURL(widget.post['url']),
    );
  }
}

_launchMediumURL(String postUrl) async {
  if (await canLaunch(postUrl)) {
    await launch(postUrl);
  } else {
    throw 'Could not launch $postUrl';
  }
}
