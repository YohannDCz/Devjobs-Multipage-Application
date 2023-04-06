import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
  });

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
        child: Column(
          children: [
            if (isMobile(context))
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ShortInputContent(),
              ),
            if (isTablet(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: LongInputContent(),
              ),
            if (isDesktop(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 165),
                child: LongInputContent(),
              ),
          ],
        ),
      ),
    );
  }
}

class ShortInputContent extends StatelessWidget {
  const ShortInputContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
          ),
          child: TextField(
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
      ],
    );
  }
}

class LongInputContent extends StatefulWidget {
  const LongInputContent({
    super.key,
  });

  @override
  State<LongInputContent> createState() => _LongInputContentState();
}

class _LongInputContentState extends State<LongInputContent> {
  bool _isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
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
                child: SvgPicture.asset(fit: BoxFit.contain, 'assets/desktop/icon-search.svg', width: 24.0, height: 24.0, color: Color(0xff5964E0)),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Filter by title...', contentPadding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0), border: InputBorder.none),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 2.0, color: Color(0x206E8098)),
            right: BorderSide(width: 2.0, color: Color(0x206E8098)),
          ),
          color: Colors.white,
        ),
        child: Container(
            width: 214.0,
            height: 80.0,
            color: Colors.white,
            child: Stack(children: [
              Positioned(
                top: 28.0,
                left: 24.0,
                child: SvgPicture.asset(fit: BoxFit.contain, 'assets/desktop/icon-location.svg', width: 24.0, height: 24.0, color: Color(0xff5964E0)),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Filter by location...', contentPadding: EdgeInsets.only(left: 57.0, top: 32.0, right: 20.0), border: InputBorder.none),
              ),
            ])),
      ),
      Container(
        width: 254.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                    value: _isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Full Time',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Kumbh Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 80.0,
                height: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: const Color(0xFF5964E0),
                ),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Kumbh Sans",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )),
                )
              ),
            ],
          ),
        ),
      )
      // Positioned(
      //   right: 16.0,
      //   bottom: 16.0,
      //   child: Container(
      //     width: 48.0,
      //     height: 48.0,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(6.0),
      //       color: const Color(0xFF5964E0),
      //     ),
      //     child: SvgPicture.asset(
      //       alignment: Alignment.center,
      //       fit: BoxFit.none,
      //       'assets/desktop/icon-search.svg',
      //       width: 20,
      //       height: 20,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    ]);
  }
}
