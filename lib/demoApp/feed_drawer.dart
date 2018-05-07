import 'package:flutter/material.dart';
import 'package:flutter_feed/demoApp/generic_feed_page.dart';
import 'package:flutter_feed/demoApp/twitter_feed_page.dart';

class FeedDrawer extends StatefulWidget {
  FeedDrawer();

  @override
  _FeedDrawerState createState() => _FeedDrawerState();
}

class _FeedDrawerState extends State<FeedDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: FlutterLogo(size: 100.0),
          ),
          ListTile(
            title: Text('Generic Feed'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GenericFeedPage()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Twitter Feed'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TwitterFeedPage()));
            },
          ),
        ],
      ),
    );
  }
}
