import 'package:flutter/material.dart';
import 'package:flutter_feed/collector/twitter_collector.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'async demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;

  @override
  initState() {
    super.initState();

    var collector = new TwitterCollector();

    collector.gather().then((value) {
      print(value);
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text("Loading..."),
          ),
          body: new Center(
            child: new CircularProgressIndicator(),
          ));
    } else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new ListView(
            children: data
                .map((tweet) => new ListTile(
                      title: new Text(tweet["user"]["name"]),
                      subtitle: new Text(tweet["text"]),
                      leading: new Image.network(
                          tweet["user"]["profile_image_url_https"]),
                      isThreeLine: true,
                    ))
                .toList(),
          ),
        ),
      );
    }
  }
}
