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

And instanciate your twitter feed widget

``TwitterFeedWidget()``

Twitter Feed - Overview

<img src="img/twitter_feed.jpg" width="200">


## The Generic Feed

A generic feed you can customize with your own collector and renderer.
With this one, you can focus on collecting and displaying your data.

To use the generic feed, you have to implement your data collector and your renderer.

The collector must extends the Abstract class ``AbstractCollector``. The
``gather()`` method will be used to collect the data.

The renderer must extends the Abstract class ``AbstractRenderer``. The
``render()`` method will be used to generate the feed widget.

If you want an example, have a look at the ``ExampleCollector`` and ``ExampleRenderer``
 in the abstract_collector and abstract_renderer files.
 
Once all your collector and renderer are done, just call the GenericFeed with
```
GenericFeed(MyCollector(), MyRenderer())
```

## TODO

 - More feeds : Medium, Github ?
 - Package and publish it to allow simple integration

## Author

Alexi Coard (alexicoard[at]gmail.com)

## Contributing
Feel free to contribute if you want to add more feeds, improve code or fix bugs !