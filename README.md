# flutter_feed

Flutter feed generator - Generate some awesome feeds widgets using Flutter

## Demo App

This repo includes a repo app, if you download it and launch main.dart
you will run a "Demo App" with all the feeds examples in the drawer

/!\ Some Feeds require some configuration before you can run them 
for example the Twitter Feed require a config.yaml file (See below section)

## The twitter feed

A feed to get user timeline given by its credentials

Use the available constructor to inject credentials from a 
config.yaml file following this pattern

```
twitterFeed:
  consumerKey: foo
  consumerSecret: bar
  accessToken: peanuts
  accessTokenSecret: spaghetti

```

Twitter Feed - Overview

<img src="img/twitter_feed.jpg" width="200">

## TODO

 - More feeds : Medium, Github ?
 - Package and publish it to allow simple integration

## Author

Alexi Coard (alexicoard[at]gmail.com)

## Contributing
Feel free to contribute if you want to add more feeds