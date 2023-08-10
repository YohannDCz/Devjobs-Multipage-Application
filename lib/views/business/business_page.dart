import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../appbar/app_bar.dart';
import '../../model/json_model.dart';
import 'businesses.dart';

class BusinessPage extends StatefulWidget {
  final int id;
  const BusinessPage({super.key, required this.id});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<Business?> fetchDataById(int id) async {
    try {
      // Charger le fichier JSON depuis les actifs
      String jsonString = await rootBundle.loadString('assets/data.json');

      // Convertir la chaîne JSON en une liste de map
      List<dynamic> jsonList = json.decode(jsonString);

      // Rechercher l'élément correspondant à l'ID donné
      Map<String, dynamic>? jsonData = jsonList.firstWhere(
        (element) {
          return element['id'] == id;
        },
        orElse: () => null,
      );

      if (jsonData != null) {
        // Créer une instance de Business à partir des données JSON
        Business data = Business.fromJson(jsonData);
        return data;
      }
    } catch (e) {
      print('Erreur lors de la récupération des données JSON : $e');
    }

    return null; // Aucune correspondance trouvée ou erreur de traitement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: ListView(children: [
        const appBar(),
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.error != null) {
              return Text(snapshot.error.toString());
            }
            return snapshot.data == null ? const CircularProgressIndicator() : Businesses(item: snapshot.data!);
          },
          future: fetchDataById(widget.id),
        ),
        // const Cta(),
      ]),
    );
  }
}
