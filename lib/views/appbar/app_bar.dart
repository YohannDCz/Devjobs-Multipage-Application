import 'package:devjobs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devjobs/views/input/input.dart';

import 'logoswitch.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      appBar(),
      Input(),
    ]);
  }
}
// ignore: camel_case_types
class appBar extends StatelessWidget {
  const appBar({
    super.key,
  });

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isMobile(context))
          SizedBox(
            height: 136.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    )
                  },
                  child: SvgPicture.asset(
                    'assets/mobile/bg-pattern-header.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                child: const LogoSwitch(),
              ),
            ]),
          ),
        if (isTablet(context))
          SizedBox(
            height: 160.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100.0)), // set border radius here
                  child: SvgPicture.asset(
                    'assets/mobile/bg-pattern-header.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32.0, right: 40.0, left: 40.0),
                child: const LogoSwitch(),
              ),
            ]),
          ),
        if (isDesktop(context))
          SizedBox(
            height: 160.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100.0)), // set border radius here
                  child: SvgPicture.asset(
                      'assets/mobile/bg-pattern-header.svg',
                      fit: BoxFit.fitWidth,
                    ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32.0, right: 165.0, left: 165.0),
                child: const LogoSwitch(),
              ),
            ]),
          ),
      ],
    );
  }
}




