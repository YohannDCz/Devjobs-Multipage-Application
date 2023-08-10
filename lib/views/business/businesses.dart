import 'package:flutter/material.dart';

import '../../model/json_model.dart';
import 'business_card.dart';
import 'business_description.dart';
import 'cta.dart';

class Businesses extends StatelessWidget {
  final Business item;

  const Businesses({required this.item, super.key});

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
    return Center(
      child: Padding(
        padding: isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 24.0)
            : isTablet(context)
                ? const EdgeInsets.symmetric(horizontal: 40.0)
                : const EdgeInsets.symmetric(horizontal: 355.0),
        child: Container(
          width: double.infinity,
          transform: Matrix4.translationValues(0.0, -40, 0.0),
          child: Column(
            children: [
              BusinessCard(item, styleText: _styleText, styleText2: _styleText2),
              BusinessDescription(item, styleText: _styleText, styleText2: _styleText2),
              const Cta()
            ],
          ),
        ),
      ),
    );
  }
}
