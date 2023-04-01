// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:async' show Future;
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;

// class Brands extends StatelessWidget {
//   const Brands({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Cards();
//   }
// }

// class MyData {
//   final List data = [];

//   MyData({required this.data});

//   factory MyData.fromJson(Map<String, dynamic> json) {
//     return MyData(
//       data: []
//     );
//   }
// }

// class Cards extends StatefulWidget {
//   const Cards({super.key});

//   @override
//   State<Cards> createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {
//   List<MyData> myDataList = [];

//   @override
//   void initState() {
//     super.initState();
//     loadJsonData();
//   }

//   Future<void> loadJsonData() async {
//     final String jsonData = await rootBundle.loadString('assets/data.json');
//     final data = json.decode(jsonData);
//     final List<MyData> dataList = [];
//     for (var i = 0; i < data.length; i++) {
//       dataList.add(MyData.fromJson(data[i]));
//     }
//     setState(() {
//       myDataList = dataList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: myDataList.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Card(item: myDataList[index]);
//       },
//     );
//   }
// }

// class Card extends StatefulWidget {
//   final dynamic item;

//   const Card({super.key, required this.item});

//   @override
//   State<Card> createState() => _CardState();
// }

// class _CardState extends State<Card> {
//   late dynamic _item = {};

//   @override
//   void initState() {
//     super.initState();
//     _item = widget.item;
//   }

//   final _styleText = const TextStyle(
//     fontSize: 16.0,
//     fontWeight: FontWeight.normal,
//     fontFamily: "Kumbh Sans",
//     color: Color(0xFF6E8098),
//   );

//   final _styleText2 = const TextStyle(
//     fontSize: 20.0,
//     fontWeight: FontWeight.bold,
//     fontFamily: "Kumbh Sans",
//     color: Color(0xFF19202D),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: 276.0,
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 49.0),
//             child: Container(
//               width: 327.0,
//               height: 228.0,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 49.0,
//                     left: 32.0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(children: [
//                           Text(
//                             _item["postedAt"],
//                             style: _styleText,
//                           ),
//                           Text(
//                             "•",
//                             style: _styleText,
//                           ),
//                           Text(
//                             _item["contract"],
//                             style: _styleText,
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             _item['position'],
//                             style: _styleText2,
//                           ),
//                         ),
//                         Text(
//                           _item["company"],
//                           style: _styleText,
//                         ),
//                       ],
//                     ),
//                   ),
//                   // ignore: prefer_const_constructors
//                   Positioned(
//                     bottom: 36.0,
//                     left: 32.0,
//                     // ignore: prefer_const_constructors
//                     child: Text(
//                       _item['location'],
//                       // ignore: prefer_const_constructors
//                       style: TextStyle(
//                         color: const Color(0xFF5964E0), // set the text color
//                         fontSize: 14.0, // set the font size
//                         fontWeight: FontWeight.bold, // set the font weight // set the font style/ set the letter spacing// set the word spacing// set the text decoration // set the text decoration color // set the text decoration style
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 32.0,
//           left: 32.0,
//           child: Container(
//             width: 50.0,
//             height: 50.0,
//             decoration: BoxDecoration(
//               color: const Color(0xffE99210),
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             child: SvgPicture.asset(
//               _item["logo"],
//               width: 40.0,
//               fit: BoxFit.scaleDown,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
