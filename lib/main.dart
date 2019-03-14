import 'package:flutter/material.dart';
import 'package:weighing_planet/ui/weighingmachine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weighing Machine',
      home: WeightingMachine(),
    );
  }
}

