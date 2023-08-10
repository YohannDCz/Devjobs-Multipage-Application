import 'package:flutter/material.dart';

import '../../model/json_model.dart';
import 'card_brand.dart';


class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isOpen = false;

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  void openContainer() {
    setState(() {
      isOpen = !isOpen;
    });
  }

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
                    ? isOpen
                        ? 3500
                        : 2960
                    : isTablet(context)
                        ? isOpen
                            ? 2100
                            : 1550
                        : isDesktop(context)
                            ? isOpen
                                ? 1730
                                : 1340
                            : 1340,
                child: isMobile(context)
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: CardBrand(item: data[index]),
                          );
                        },
                      )
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet(context) ? 2 : 3,
                          crossAxisSpacing: isTablet(context) ? 11.0 : 40.0,
                          childAspectRatio: isTablet(context) ? (itemWidth / itemHeight) : 1,
                        ),
                        itemBuilder: (context, index) => CardBrand(item: data[index]),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0, bottom: 62.0),
              width: 142.0,
              height: 48.0,
              child: ElevatedButton(
                  onPressed: openContainer,
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