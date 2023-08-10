import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'switchbutton.dart';

class LogoSwitch extends StatelessWidget {
  const LogoSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
