import 'package:flutter/material.dart';
import 'package:test_inherited/screens/counter_screen.dart';
import 'package:test_inherited/state_inherited_widget.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
      ),
      body: OverviewItem(),
    );
  }
}

class OverviewItem extends StatelessWidget {
  const OverviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateWidget = StateInheritedWidget.of(context);
    final counter = stateWidget != null ? stateWidget.counter : 0;
    final Color color = stateWidget != null ? stateWidget.color : Colors.red;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            color: color,
            elevation: 12,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Counter: $counter ',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber,
                ),
                child: TextButton(
                    onPressed: () => stateWidget?.incrementCounter(),
                    child: Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.white,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber,
                ),
                child: TextButton(
                    onPressed: () => stateWidget?.decrementCounter(),
                    child: Icon(
                      Icons.exposure_minus_1,
                      size: 32,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            child: TextButton(
                onPressed: () => stateWidget?.changeColor(Colors.red),
                child: Text(
                  'Change Color',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                )),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CounterScreen.route,
                );
              },
              child: Text(
                'Go to Counter Page',
              ),
            ),
          )
        ],
      ),
    );
  }
}
