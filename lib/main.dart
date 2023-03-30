import 'package:flutter/material.dart';
<<<<<<<
import 'package:indexed/indexed.dart';
import 'package:devjobs/app-bar.dart';
import 'package:devjobs/column.dart';
=======
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indexed/indexed.dart';
>>>>>>>

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
        ],
      ),
    ));
  }
}

// ignore: camel_case_types
class appBar extends StatelessWidget {
  const appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.

      height: 200,
      child: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            'assets/mobile/bg-pattern-header.svg',
            fit: BoxFit.cover,
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
<<<<<<<

=======

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
      activeColor: const Color(0xff5964E0),
      inactiveThumbColor: const Color(0xff5964E0),
      inactiveTrackColor: Colors.white,
      activeTrackColor: Colors.white,
    );
  }
}

>>>>>>>