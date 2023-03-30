
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Stack(children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
          ),
          child: const TextField(
            decoration: InputDecoration(hintText: 'Filter by title...', contentPadding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0), border: InputBorder.none),
          ),
        ),
        Positioned(
          left: 220.0,
          top: 30.0,
          child: SvgPicture.asset(
            fit: BoxFit.none,
            'assets/mobile/icon-filter.svg',
            width: 20.0,
            height: 20.0,
            color: Colors.grey,
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 16.0,
          child: Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: const Color(0xFF5964E0),
            ),
            child: SvgPicture.asset(
              alignment: Alignment.center,
              fit: BoxFit.none,
              'assets/desktop/icon-search.svg',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
