import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:devjobs/app_bar.dart';
// import 'package:devjobs/cards.dart';
import 'cards copy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devjobs',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xff5964E0)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get decoration => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Indexer(children: [
        Indexed(
          index: 10,
          child: Positioned(
            child: appBar(),
          ),
        ),
        Indexed(
          index: 100,
          child: Positioned(
            child: Brands(),
          ),
        ),
      ]),
    );
  }
}
