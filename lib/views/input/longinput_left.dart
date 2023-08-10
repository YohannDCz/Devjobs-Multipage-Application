import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchLeft extends StatelessWidget {
  const SearchLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
          ),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 28.0,
              left: 24.0,
              // ignore: deprecated_member_use
              child: SvgPicture.asset(fit: BoxFit.contain, 'assets/desktop/icon-search.svg', width: 24.0, height: 24.0, color: const Color(0xff5964E0)),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Filter by title...', contentPadding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0), border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
