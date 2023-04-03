
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

<<<<<<< Updated upstream:lib/input.dart
=======
class Brands extends StatelessWidget {
  const Brands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        transform: Matrix4.translationValues(0.0, 160.0, 0.0),
        width: 327,
        child: Column(children: const [Input(), Card()]),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 276.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 49.0),
        child: Container(
          width: 327.0,
          height: 228.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Stack(children: [
            Positioned(
              top: -25.0,
              left: 32.0,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color(0xffE99210),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SvgPicture.asset(
                  'assets/logos/scoot.svg',
                  width: 40.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

>>>>>>> Stashed changes:lib/column.dart
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
          top: 30.0,
          right: 88.0,
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
