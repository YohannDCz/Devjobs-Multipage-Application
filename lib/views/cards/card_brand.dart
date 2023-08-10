import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/json_model.dart';
import '../business/business_page.dart';
import '../hexcolor.dart';

class CardBrand extends StatelessWidget {
  final dynamic item;

  const CardBrand({super.key, required this.item});

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusinessPage(id: item.id)),
        );
      },
      child: Stack(
        children: [
          SizedBox(
            height: 276.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 49.0),
              child: Container(
                width: 327.0,
                height: 228.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 49.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              item.postedAt,
                              style: _styleText,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "•",
                                style: _styleText,
                              ),
                            ),
                            Text(
                              item.contract == Contract.FREELANCE
                                  ? "Freelance"
                                  : item.contract == Contract.PART_TIME
                                      ? "Part Time"
                                      : item.contract == Contract.FULL_TIME
                                          ? "Full Time"
                                          : "",
                              style: _styleText,
                            )
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              item.position,
                              style: _styleText2,
                            ),
                          ),
                          Text(
                            item.company,
                            style: _styleText,
                          ),
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Positioned(
                      bottom: 36.0,
                      left: 32.0,
                      // ignore: prefer_const_constructors
                      child: Text(
                        item.location,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: const Color(0xFF5964E0), // set the text color
                          fontSize: 14.0, // set the font size
                          fontWeight: FontWeight.bold, // set the font weight // set the font style/ set the letter spacing// set the word spacing// set the text decoration // set the text decoration color // set the text decoration style
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 32.0,
            left: 32.0,
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
    );
  }
}
