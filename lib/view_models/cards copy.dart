import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Brands extends StatelessWidget {
  const Brands({
    super.key,
  });

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 620;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width <= 1024;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1024;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      child: Column(
        children: [
          if (isMobile(context)) 
            SizedBox(
              height: 3300.0,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24),
                crossAxisCount: 1,
                mainAxisSpacing: 24.0,
                childAspectRatio: 2,
                children: [
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                ],
              ),
            )
          else if (isTablet(context))
            SizedBox(
              height: 1718.0,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40),
                crossAxisCount: 2,
                crossAxisSpacing: 11.0,
                children: [
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                ],
                ),
            )
          else if (isDesktop(context))
            SizedBox(
              height: 1132.0,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 165.0),
                crossAxisCount: 3,
                crossAxisSpacing: 30.0,
                childAspectRatio: 1.2,
                children: [
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                  Card1(),
                ],
                ),
            ),
        
        ],
      ),
    );
  }
}

class Card1 extends StatefulWidget {
  const Card1({super.key});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
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

  _Card1State();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 276.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
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
                            "5h ago",
                            style: _styleText,
                          ),
                          Text(
                            "•",
                            style: _styleText,
                          ),
                          Text(
                            "Full Time",
                            style: _styleText,
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Senior Software Egineer",
                            style: _styleText2,
                          ),
                        ),
                        Text(
                          "Scoot",
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
                      "United Kingdom",
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
          top: 25.0,
          left: 32.0,
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
    );
  }
}
