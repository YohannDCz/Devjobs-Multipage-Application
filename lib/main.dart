import 'package:devjobs/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:devjobs/view_models/app_bar.dart';
// import 'package:devjobs/view_models/cards_copy.dart';
import 'package:devjobs/view_models/cards.dart';
// import 'package:devjobs/utils/json_model.dart';
// import 'package:devjobs/utils/loadjson.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devjobs',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xff5964E0), brightness: Brightness.light),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get decoration => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: ListView(children: [
        appBar(),
        Input(),
        Brands(),
      ]),
    );
  }
}
