import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devjobs/utils/input.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          Container(
            height: 136.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(
                  'assets/mobile/bg-pattern-header.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                child: LogoSwitch(),
              ),
            ]),
          ),
        if (isTablet(context))
          Container(
            height: 160.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0)), // set border radius here
                  child: SvgPicture.asset(
                    'assets/mobile/bg-pattern-header.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 32.0, right: 40.0, left: 40.0),
                child: LogoSwitch(),
              ),
            ]),
          ),
        if (isDesktop(context))
          Container(
            height: 160.0,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0)), // set border radius here
                  child: SvgPicture.asset(
                      'assets/mobile/bg-pattern-header.svg',
                      fit: BoxFit.fitWidth,
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 32.0, right: 165.0, left: 165.0),
                child: LogoSwitch(),
              ),
            ]),
          ),
      ],
    );
  }
}

class LogoSwitch extends StatelessWidget {
  const LogoSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
      SvgPicture.asset(
        'assets/desktop/logo.svg',
        fit: BoxFit.cover,
      ),
      Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(
            'assets/desktop/icon-moon.svg',
          ),
        ),
        const SwitchButton(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(
            'assets/desktop/icon-sun.svg',
          ),
        ),
      ]),
    ]);
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
      activeColor: const Color(0xff5964E0),
      inactiveThumbColor: const Color(0xff5964E0),
      inactiveTrackColor: Colors.white,
      activeTrackColor: Colors.white,
    );
  }
}
