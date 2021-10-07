import 'dart:math';

import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int counter = 0;
  Color color = Colors.blue;

  final List<Color> availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.blueAccent,
    Colors.pink,
    Colors.red,
    Colors.grey,
    Colors.brown,
  ];
  final randomizer = Random();

  //increment the counter
  void incrementCounter() {
    setState(() {
      counter += 1;
    });
  }

  void decrementCounter() {
    setState(() {
      counter -= 1;
    });
  }

  void changeColor(Color newColor) {
    setState(() {
      color = availableColors[randomizer.nextInt(7)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      counter: counter,
      color: color,
      child: widget.child,
      stateWidget: this,
    );
  }
}

class StateInheritedWidget extends InheritedWidget {
  final int counter;
  final Color color;
  final _StateWidgetState stateWidget;

  const StateInheritedWidget({
    Key? key,
    required Widget child,
    required this.counter,
    required this.color,
    required this.stateWidget,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) {
    final _rebuildFag =
        oldWidget.counter != counter || oldWidget.color != color;
    return _rebuildFag;
  }

  static _StateWidgetState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()
        ?.stateWidget;
  }
}
