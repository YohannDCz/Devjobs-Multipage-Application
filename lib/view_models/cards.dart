import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devjobs/utils/json_model.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FractionallySizedBox(
        widthFactor: 0.872,
        child: SizedBox(
          width: 327,
          height: 1000.0,
          child: Cards(),
        ),
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
//   var _data = [];

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     // Perform asynchronous initialization of the state
//     final data = await fetchData();
//     setState(() {
//       _data = data;
//     });
//   }

  // Future<List<String>> fetchData() async {
  //   // Fetch data asynchronously
  //   final response = await http.get('https://example.com/data');
  //   final data = json.decode(response.body);
  //   return List<String>.from(data['items']);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getDataList(); // call the async function to fetch data
  // }

  // Future<void> _getDataList() async {
  //   List<Data> data;
  //   debugPrint("${data[0].id}");
  //   setState(() {
  //     final data = await getDataList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<Data>;
            return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => Card1(item: data[index]));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
        future: fetchData());
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
                            this.item.postedAt,
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
                            this.item.contract.toString(),
                            style: _styleText,
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            this.item.position,
                            style: _styleText2,
                          ),
                        ),
                        Text(
                          this.item.company,
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
                      this.item.location,
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
              color: const Color(0xffE99210),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SvgPicture.asset(
              this.item.logo,
              width: 40.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
