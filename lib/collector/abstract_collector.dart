import 'dart:async';

///
/// The Abstract Collector widget is basically an abstract class to implement if
/// you want to use the GenericFeed widget. It call also be a good start if you don't
/// know how to collect your data in an async way.
///
/// You need to implement the gather method, which returns a Future with your data
/// Future as been chosen because most of the time, you will collect your data in
/// an async way.
///
abstract class AbstractCollector {
  AbstractCollector();
  gather();
}

class ExampleCollector extends AbstractCollector {
  ExampleCollector();

  gather() async {
    await new Future.delayed(new Duration(seconds: 3));

    return [1, 2, 3];
  }
}
