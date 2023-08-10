import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/json_model.dart';
import '../hexcolor.dart';

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
                            width: 160.0,
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
                              child: const Text(
                                'Company Site',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Kumbh Sans",
                                ),
                              ),
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
