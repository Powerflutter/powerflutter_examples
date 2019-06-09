import 'package:flutter/material.dart';
import 'package:powerflutter/powerflutter.dart';
import 'package:powerflutter_examples/examples/Counter_Example.dart';

import 'models/counter.dart';

void main() {
  setupCounterExample();
  runApp(MyApp());
}

class MyApp extends PowerWidget<CounterModel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: CounterExampleWidget());
  }
}
