# powerflutter_examples

Examples for the Powerflutter Framework.

## Getting Started

How does [Powerflutter](https://github.com/Powerflutter/powerflutter) work? Here is an example how to use the dependecy injection, setup a model that automatically updates the UI and can be saved and loaded to shared preferences with a single line of code.

First lets look into the setup, which is called in your main method and fairly simple

```
setupCounterExample() {
  var model = CounterModel(); // Create the model
  Power.setDI(model); // Add it into the dependency injection
  PowerSharedPreferences.persistModel(model, "counterModel"); // Model is now loaded from SharedPrefrences & saved everytime something changes
}
```

How does our model look like?

```
class CounterModel with PowerModel {
  int get counter => get('counter', () => 0);
  set counter(int value) => set('counter', value);
}
```

We have have getters and setters for an int called counter that calls set and get function provided by the `PowerModel` mixin. This allows later for automatic UI updates whenever something changes and automatic saving to shared preferences. Well actually the code looks a bit different becaus we use code generation to create the getters and setters which makes it even simpler and more maintainable for large projects. Please see the [Powerflutter Code Generation](https://github.com/Powerflutter/powerflutter_code_generation) for more information.

Building the UI now is very simple:

```
class CounterExampleWidget extends PowerWidget<CounterModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("You have tapped the button ${model.counter} times")),
      floatingActionButton: FloatingActionButton(onPressed: () => model.counter++, child: Icon(Icons.add)),
    );
  }
}
```

Using the `PowerWidget` will automatically update the view when any data changes and because we used the generic `<CounterModel>` the .model property is a typed data model taken from the dependency injection.
The `PowerWidget` always updates any UI when an value from a `PowerModel` used in this widget changes, so no need to call setState or any other boilerplate code and we can just call odel.counter++ here or in any other part of the code and any UI that depends on this value will update.

