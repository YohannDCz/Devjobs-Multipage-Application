import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> loadJsonData() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  return jsonString;
}

Future<Map<String, dynamic>> getJsonData() async {
  String jsonString = await loadJsonData();
  Map<String, dynamic> data = jsonDecode(jsonString);
  return data;
}

final data = getJsonData();