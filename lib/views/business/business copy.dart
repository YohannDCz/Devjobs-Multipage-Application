import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../appbar/app_bar.dart';
import '../../model/json_model.dart';
import '../hexcolor.dart';

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

class Businesses extends StatelessWidget {
  final Business item;

  const Businesses({required this.item, super.key});

  final _styleText = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    fontFamily: "Kumbh Sans",
    color: Color(0xFF6E8098),
  );

  final _styleText2 = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: "Kumbh Sans",
    color: Color(0xFF19202D),
  );

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 24.0)
            : isTablet(context)
                ? const EdgeInsets.symmetric(horizontal: 40.0)
                : const EdgeInsets.symmetric(horizontal: 355.0),
        child: Container(
          width: double.infinity,
          transform: Matrix4.translationValues(0.0, -40, 0.0),
          child: Column(
            children: [
              BusinessCard(item, styleText: _styleText, styleText2: _styleText2),
              BusinessDescription(item, styleText: _styleText, styleText2: _styleText2),
            ],
          ),
        ),
      ),
    );
  }
}

class Cta extends StatelessWidget {
  const Cta({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
            height: 96.0,
            color: Colors.white,
            child: Center(
              child: Container(
                  width: 327.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5964E0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kumbh Sans",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            )));
  }
}

class BusinessDescription extends StatelessWidget {
  final Business item;
  final TextStyle _styleText;
  final TextStyle _styleText2;

  const BusinessDescription(
    this.item, {
    super.key,
    required TextStyle styleText,
    required TextStyle styleText2,
  })  : _styleText = styleText,
        _styleText2 = styleText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(item.postedAt, style: _styleText),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text('•', style: _styleText),
                  ),
                  Text(
                      item.contract == Contract.FREELANCE
                          ? "Freelance"
                          : item.contract == Contract.PART_TIME
                              ? "Part Time"
                              : item.contract == Contract.FULL_TIME
                                  ? "Full Time"
                                  : "",
                      style: _styleText),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                  child: Text(item.position, style: _styleText2),
                ),
                Text(
                  item.location,
                  style: const TextStyle(
                    color: Color(0xFF5964E0), // set the text color
                    fontSize: 14.0, // set the font size
                    fontWeight: FontWeight.bold, //
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                  width: double.infinity,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5964E0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kumbh Sans",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(item.description, style: _styleText),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 66.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Requirements", style: _styleText2),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(item.requirements.content, style: _styleText),
                )
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListView.builder(
                  itemCount: item.requirements.items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text(item.requirements.items[index], style: _styleText),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 66.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("What You Will Do", style: _styleText2),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(item.role.content, style: _styleText),
                )
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListView.builder(
                  itemCount: item.role.items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          index.toString(),
                          style: const TextStyle(
                            color: Color(0xFF5964E0),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text(item.role.items[index], style: _styleText),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  final Business item;
  final TextStyle _styleText;
  final TextStyle _styleText2;

  const BusinessCard(
    this.item, {
    super.key,
    required TextStyle styleText,
    required TextStyle styleText2,
  })  : _styleText = styleText,
        _styleText2 = styleText2;

  bool isTabletOrDesktop(BuildContext context) => MediaQuery.of(context).size.width > 820;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isTabletOrDesktop(context))
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.company,
                              style: _styleText2,
                            ),
                            Text(
                              item.website,
                              style: _styleText,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 40.0,
                          top: 46.0,
                          child: SizedBox(
                            width: 146.0,
                            height: 48.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // Action to perform when the button is pressed
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEEEFFC),
                                primary: const Color(0xFF5964E0),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text('Company Site',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Kumbh Sans",
                                  )),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: HexColor.fromHex(item.logoBackground),
                  ),
                  child: SvgPicture.asset(
                    item.logo,
                    width: 80.0,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ],
          )
        else
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  height: 230.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      width: 327.0,
                      height: 205.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 49.0, bottom: 8.0),
                                  child: Text(
                                    item.company,
                                    style: _styleText2,
                                  ),
                                ),
                                Text(
                                  item.website,
                                  style: _styleText,
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          Positioned(
                              bottom: 32.0,
                              left: 0.0,
                              right: 0.0,
                              // ignore: prefer_const_constructors
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Action to perform when the button is pressed
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFEEEFFC),
                                    primary: const Color(0xFF5964E0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: const Text('Company Site'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: HexColor.fromHex(item.logoBackground),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SvgPicture.asset(
                    item.logo,
                    width: 40.0,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
