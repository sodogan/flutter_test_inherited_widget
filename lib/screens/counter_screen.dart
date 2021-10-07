import 'package:flutter/material.dart';
import 'package:test_inherited/state_inherited_widget.dart';

class CounterScreen extends StatelessWidget {
  static const String route = '/counter';

  @override
  Widget build(BuildContext context) {
    final stateWidget = StateInheritedWidget.of(context);
    final counter = stateWidget != null ? stateWidget.counter : 0;
    final Color color = stateWidget != null ? stateWidget.color : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: color,
              elevation: 12,
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Counter: $counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  stateWidget?.incrementCounter();
                  //Navigator.of(context).pop();
                },
                child: Text(
                  'Increment Counter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
