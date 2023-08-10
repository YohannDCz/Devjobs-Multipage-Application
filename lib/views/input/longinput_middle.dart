import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchMiddle extends StatelessWidget {
  const SearchMiddle({super.key});

  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 2.0, color: Color(0x206E8098)),
          right: BorderSide(width: 2.0, color: Color(0x206E8098)),
        ),
        color: Colors.white,
      ),
      child: Container(
        width: isTablet(context) ? 214.0 : 300.0,
        height: 80.0,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 28.0,
              left: 24.0,
              // ignore: deprecated_member_use
              child: SvgPicture.asset(fit: BoxFit.contain, 'assets/desktop/icon-location.svg', width: 24.0, height: 24.0, color: const Color(0xff5964E0)),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Filter by location...', contentPadding: EdgeInsets.only(left: 57.0, top: 32.0, right: 20.0), border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
