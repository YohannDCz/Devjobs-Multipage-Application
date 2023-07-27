import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devjobs/model/json_model.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: null,
        child: Wrap(children: [Cards()]),
      ),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool open = false;

  // void openContainer() {
  //   setState(open = !open);
  // }
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data as List<Business>;
          return Column(children: [
            Padding(
              padding: isMobile(context)
                  ? const EdgeInsets.symmetric(horizontal: 24.0)
                  : isTablet(context)
                      ? const EdgeInsets.symmetric(horizontal: 40.0)
                      : const EdgeInsets.symmetric(horizontal: 165.0),
              child: SizedBox(
                height: isMobile(context)
                    ? 3410.0
                    : isTablet(context)
                        ? 2000.0
                        : 1425.0,
                child: isMobile(context)
                    ? ListView.builder(
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Card1(item: data[index]),
                          );
                        },
                      )
                    : GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet(context) ? 2 : 3,
                          crossAxisSpacing: isTablet(context) ? 11.0 : 40.0,
                          childAspectRatio: isTablet(context) ? (itemWidth / itemHeight) : 1,
                        ),
                        itemBuilder: (context, index) => Card1(item: data[index]),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0, bottom: 62.0),
              width: 142.0,
              height: 48.0,
              child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF5964E0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Load More",
                    style: TextStyle(
                      fontFamily: "Kumbh Sans",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  )),
            )
          ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class Card1 extends StatelessWidget {
  final dynamic item;

  const Card1({super.key, required this.item});

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
    return Stack(
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
              color: Color(item.logoBackground),
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
    );
  }
}
