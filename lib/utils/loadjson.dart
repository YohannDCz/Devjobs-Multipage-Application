import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';

Future<String> _loadJsonAsset() async {
  return await rootBundle.loadString('assets/data.json');
}

Future<dynamic> getJsonData() async {
  String jsonString = await _loadJsonAsset();
  final jsonResponse = json.decode(jsonString);
  return jsonResponse;
}

dynamic data = getJsonData();