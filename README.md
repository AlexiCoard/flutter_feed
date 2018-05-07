# flutter_feed

Flutter feed generator - A bunch of widgets to build feeds

## The tweeter feed

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
![Twitter_Feed](img/twitter_feed.jpg)

## TODO

 - Do we keep the abstract feed interface ?
 - Twitter feed todo : better images ? Wrap this in refreshIndicator
 - More feeds : Medium, other ?
 - Maybe a package containing all feeds and a generic class to extends ?

## Author

Alexi Coard (alexicoard[at]gmail.com)

## Contributing
Feel free to contribute if you want to add more feeds