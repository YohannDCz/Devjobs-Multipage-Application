import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devjobs/utils/json_model.dart';

class Brands extends StatelessWidget {
  Brands({
    super.key,
  });

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;
  final List<String> _data = ["Chuck Norris", "John Doe", "Miley Cyrus"];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      padding: isDesktop(context)? EdgeInsets.only(bottom: 64.0): EdgeInsets.only(bottom: 32.0),
      child: Column(
        children: [
          if (isMobile(context))
            Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2,
                padding: const EdgeInsets.all(8),
                children: [
                ]
              )
            )
          else if (isTablet(context))
            Padding(
              padding: const EdgeInsets.only(bottom: 56.0),
              child: SizedBox(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.0,
                  shrinkWrap: true,
                  childAspectRatio: (itemWidth / itemHeight),
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
            )
          else if (isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(bottom: 56.0),
              child: SizedBox(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 165.0),
                  crossAxisCount: 3,
                  crossAxisSpacing: 30.0,
                  shrinkWrap: true,
                  childAspectRatio: (itemWidth / (1.85 * itemHeight)),
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
            ),
          Container(
            width: 142.0,
            height: 48.0,
            child: ElevatedButton(onPressed: () => {}, 
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5964E0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
            child: Text("Load More", style: TextStyle(
              fontFamily: "Kumbh Sans",
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),)),
          )
        ],
      ),
    );
  }
}

class Card1 extends StatefulWidget {
  // final dynamic item;

  // Card1({required this.item});

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
    return SizedBox(
      height: 276.0,
      child: Stack(
        children: [
          SizedBox(
            height: 276.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              "5h ago",
                              style: _styleText,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "•",
                                style: _styleText,
                              ),
                            ),
                            Text(
                              "Full Time",
                              style: _styleText,
                            )
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              "Senior Software Egineer",
                              style: _styleText2,
                            ),
                          ),
                          Text(
                            "Scoot",
                            style: _styleText,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Text(
                              "United Kingdom",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: const Color(0xFF5964E0), // set the text color
                                fontSize: 14.0, // set the font size
                                fontWeight: FontWeight.bold, // set the font weight // set the font style/ set the letter spacing// set the word spacing// set the text decoration // set the text decoration color // set the text decoration style
                              ),
                            ),
                          ),
                        ],
                      ),
                    // ignore: prefer_const_constructors
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
      ),
    );
  }
}
