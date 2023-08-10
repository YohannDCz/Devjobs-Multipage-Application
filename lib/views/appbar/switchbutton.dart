import 'package:flutter/material.dart';

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
