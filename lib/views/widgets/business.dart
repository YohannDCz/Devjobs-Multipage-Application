import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:devjobs/views/components/app_bar.dart';
import '../../model/json_model.dart';

class BusinessPage extends StatefulWidget {
  final String id;
  const BusinessPage({super.key, required this.id});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  Business? myBusiness;
  get decoration => null;

  _BusinessPageState() {
    // TODO: en fonction de l'id qui est dans la Page => récupérer le bon json
    // Future
    fetchDataById(widget.id).then((data) => {
          setState(() {
            myBusiness = data;
          })
        });
  }

  Future<Business?> fetchDataById(String id) async {
    try {
      // Charger le fichier JSON depuis les actifs
      String jsonString = await rootBundle.loadString('assets/data.json');

      // Convertir la chaîne JSON en une liste de map
      List<dynamic> jsonList = json.decode(jsonString);

      // Rechercher l'élément correspondant à l'ID donné
      Map<String, dynamic>? jsonData = jsonList.firstWhere(
        (element) => element['id'] == id,
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
        myBusiness != null ? const CircularProgressIndicator() : Businesses(myBusiness!),
        const Cta(),
      ]),
    );
  }
}

class Businesses extends StatelessWidget {
  final Business myBusiness;

  const Businesses(this.myBusiness, {super.key});

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
    return Column(
      children: [
        if (isMobile(context))
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                transform: Matrix4.translationValues(0.0, -40, 0.0),
                child: Column(
                  children: [
                    BusinessCard(styleText: _styleText, styleText2: _styleText2),
                    BusinessDescription(styleText: _styleText, styleText2: _styleText2),
                  ],
                ),
              ),
            ),
          )
        else if (isTablet(context))
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                width: double.infinity,
                transform: Matrix4.translationValues(0.0, -40, 0.0),
                child: Column(
                  children: [
                    BusinessCard(styleText: _styleText, styleText2: _styleText2),
                    BusinessDescription(styleText: _styleText, styleText2: _styleText2),
                  ],
                ),
              ),
            ),
          )
        else if (isDesktop(context))
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 355.0),
              child: Container(
                width: double.infinity,
                transform: Matrix4.translationValues(0.0, -40, 0.0),
                child: Column(
                  children: [
                    BusinessCard(styleText: _styleText, styleText2: _styleText2),
                    BusinessDescription(styleText: _styleText, styleText2: _styleText2),
                  ],
                ),
              ),
            ),
          )
      ],
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

class BusinessDescription extends StatefulWidget {
  const BusinessDescription({
    super.key,
    required TextStyle styleText,
    required TextStyle styleText2,
  })  : _styleText = styleText,
        _styleText2 = styleText2;

  final TextStyle _styleText;
  final TextStyle _styleText2;

  @override
  State<BusinessDescription> createState() => _BusinessDescriptionState();
}

class _BusinessDescriptionState extends State<BusinessDescription> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
                    Text('1w ago', style: widget._styleText),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('•', style: widget._styleText),
                    ),
                    Text('PartTime', style: widget._styleText),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: Text('Software Software Engineer', style: widget._styleText2),
                  ),
                  const Text(
                    'United Kingdom',
                    style: TextStyle(
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
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti. Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.",
                    style: widget._styleText),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 66.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Requirements", style: widget._styleText2),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text("Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.", style: widget._styleText),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Morbi interdum mollis sapien. Sed", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Phasellus lacinia magna a ullamcorper laoreet, lectus arcu pulvinar risus", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus.", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Morbi interdum mollis sapien. Sed", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 66.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("What You Will Do", style: widget._styleText2),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text("Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.", style: widget._styleText),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("1",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Morbi interdum mollis sapien. Sed", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("2",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Phasellus lacinia magna a ullamcorper laoreet, lectus arcu pulvinar risus", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("3",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus.", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("4",
                            style: TextStyle(
                              color: Color(0xFF5964E0),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text("Morbi interdum mollis sapien. Sed", style: widget._styleText),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required TextStyle styleText,
    required TextStyle styleText2,
  })  : _styleText = styleText,
        _styleText2 = styleText2;

  final TextStyle _styleText;
  final TextStyle _styleText2;

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
                              "Scoot",
                              style: _styleText2,
                            ),
                            Text(
                              "scoot.com",
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
                                backgroundColor: Color(0xFFEEEFFC),
                                primary: Color(0xFF5964E0),
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
                  decoration: const BoxDecoration(
                    color: Color(0xffE99210),
                  ),
                  child: SvgPicture.asset(
                    "assets/logos/scoot.svg",
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
                                    "Scoot",
                                    style: _styleText2,
                                  ),
                                ),
                                Text(
                                  "scoot.com",
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
                                    primary: Color(0xFF5964E0),
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
                    color: const Color(0xffE99210),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SvgPicture.asset(
                    "assets/logos/scoot.svg",
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
