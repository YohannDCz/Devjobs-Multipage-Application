import 'dart:convert';

import 'package:devjobs/views/input/input.dart';
import 'package:flutter/material.dart';
import 'package:devjobs/views/appbar/app_bar.dart';
import 'package:devjobs/views/cards/cards.dart';
import 'package:flutter/services.dart';
import './model/json_model.dart';

void main() async {
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
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> initialList = [];
  List<dynamic> currentList = [];

  Future<List<dynamic>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        currentList = [...initialList];
      });
      return;
    }

    List<Business> initialListX = initialList.map((i) => Business.fromJson(i)).toList();

    List<dynamic> tempList = [];
    for (var business in initialListX) {
      if (business.company.toLowerCase().contains(query.toLowerCase())) {
        tempList = [business.toJson()]; // or do whatever you want with the matching company
      }
    }

    if (tempList.isNotEmpty) {
      setState(() {
        currentList = tempList;
      });
    }
  }

  Future<List<dynamic>> jsonData() async {
    List<dynamic> jsonList = [];
    try {
      String jsonString = await rootBundle.loadString('assets/data.json');
      jsonList = json.decode(jsonString);
    } catch (e) {
      Future.delayed(const Duration(seconds: 5), () {
        print("Error in JSON implementation: $e");
      });
    }
    return jsonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: FutureBuilder<List<dynamic>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // Once data is loaded, set your lists
            initialList = snapshot.data!;
            currentList = [...initialList];

            return ListView(children: [
              const appBar(),
              Input(search: search),
              Cards(data: currentList),
            ]);
          } else {
            // While data is loading, return a loader
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
