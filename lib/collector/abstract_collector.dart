import 'dart:async';

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
