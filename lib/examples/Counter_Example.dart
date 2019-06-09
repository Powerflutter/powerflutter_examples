import 'package:flutter/material.dart';
import 'package:powerflutter/powerflutter.dart';
import 'package:powerflutter_examples/models/counter.dart';

// this will be called in your main function
setupCounterExample() {
  var model = CounterModel(); // Create the model
  Power.setDI(model); // Add it into the dependency injection
  PowerSharedPreferences.persistModel(model, "counterModel"); // Model is now loaded from SharedPrefrences & saved everytime something changes
}

/// Using [PowerWidget] will automatically update the view when any data changes and
/// lets you use the .model property as a typed data model from the dependency injection
class CounterExampleWidget extends PowerWidget<CounterModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("You have tapped the button ${model.counter} times")),
      floatingActionButton: FloatingActionButton(onPressed: () => model.counter++, child: Icon(Icons.add)),
    );
  }
}
