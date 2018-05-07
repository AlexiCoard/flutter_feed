import 'package:flutter/material.dart';
import 'package:flutter_feed/demoApp/feed_drawer.dart';

class FeedDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feeds demo !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Feeds !'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: FeedDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            FlutterLogo(
              size: 100.0,
            ),
            Text(
              'Generate feed widgets in Flutter !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Divider(),
            Text(
                'This app is an example of what you can easily achieve using Flutter'
                ' and a few lines of code !'),
            Divider(),
            Text(
                'This includes several code samples in the drawer : A generic feed you can extends'
                ', a Twitter Feed'),
            Divider(),
            Text(
                'Feel free to star contribute on the GitHub repo : https://github.com/AlexiCoard/flutter_feed')
          ],
        ),
      ),
    );
  }
}
