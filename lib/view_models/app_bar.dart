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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        Positioned(
          top: 32.0,
          right: 24.0,
          left: 24.0,
          child: Row(
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
                  'assets/desktop/icon-sun.svg',
                ),
              ),
              const SwitchButton(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SvgPicture.asset(
                  'assets/desktop/icon-moon.svg',
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
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
