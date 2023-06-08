import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/material.dart';

 // To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

Future<List<Data>> fetchData() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  List<Data> dataList = dataFromJson(jsonString); 
  return dataList;
}

Future<void> printable() async {
  List<Data> data = await fetchData();

  debugPrint('ID: ${data[0].id}');
  debugPrint('Company: ${data[0].company}');
  debugPrint('Logo: ${data[0].logo}');
  // print other properties as needed
}

// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(data.map((x) => x.toJson()));

class Data {
    Data({
        required this.id,
        required this.company,
        required this.logo,
        required this.logoBackground,
        required this.position,
        required this.postedAt,
        required this.contract,
        required this.location,
        required this.website,
        required this.apply,
        required this.description,
        required this.requirements,
        required this.role,
    });

    int id;
    String company;
    String logo;
    String logoBackground;
    String position;
    String postedAt;
    Contract contract;
    String location;
    String website;
    String apply;
    String description;
    Requirements requirements;
    Requirements role;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        company: json["company"],
        logo: json["logo"],
        logoBackground: json["logoBackground"],
        position: json["position"],
        postedAt: json["postedAt"],
        contract: contractValues.map[json["contract"]]!,
        location: json["location"],
        website: json["website"],
        apply: json["apply"],
        description: json["description"],
        requirements: Requirements.fromJson(json["requirements"]),
        role: Requirements.fromJson(json["role"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "logo": logo,
        "logoBackground": logoBackground,
        "position": position,
        "postedAt": postedAt,
        "contract": contractValues.reverse[contract],
        "location": location,
        "website": website,
        "apply": apply,
        "description": description,
        "requirements": requirements.toJson(),
        "role": role.toJson(),
    };
}

enum Contract { FULL_TIME, PART_TIME, FREELANCE }

final contractValues = EnumValues({
    "Freelance": Contract.FREELANCE,
    "Full Time": Contract.FULL_TIME,
    "Part Time": Contract.PART_TIME
});

class Requirements {
    Requirements({
        required this.content,
        required this.items,
    });

    String content;
    List<String> items;

    factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        content: json["content"],
        items: List<String>.from(json["items"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "items": List<dynamic>.from(items.map((x) => x)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
