import 'package:flutter/material.dart';

import '../../model/json_model.dart';

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
                          child: Text(item.requirements.items[0], style: _styleText),
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
                          child: Text(item.requirements.items[1], style: _styleText),
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
                          child: Text(item.requirements.items[2], style: _styleText),
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
                          child: Text(item.requirements.items[3], style: _styleText),
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
                Text("What You Will Do", style: _styleText2),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(item.role.content, style: _styleText),
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
                          child: Text(item.role.items[0], style: _styleText),
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
                          child: Text(item.role.items[1], style: _styleText),
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
                          child: Text(item.role.items[2], style: _styleText),
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
                          child: Text(item.role.items[3], style: _styleText),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
