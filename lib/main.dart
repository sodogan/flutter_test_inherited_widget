import 'package:flutter/material.dart';
import 'package:test_inherited/screens/counter_screen.dart';
import 'package:test_inherited/state_inherited_widget.dart';
import './screens/overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => OverviewScreen(),
          CounterScreen.route: (context) => CounterScreen(),
        },
      ),
    );
  }
}
