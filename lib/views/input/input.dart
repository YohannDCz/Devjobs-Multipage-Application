import 'package:flutter/material.dart';

import 'shortinput.dart';
import 'longinput.dart';

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ShortInputContent(),
              ),
            if (isTablet(context))
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: LongInputContent(),
              ),
            if (isDesktop(context))
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 165),
                child: LongInputContent(),
              ),
          ],
        ),
      ),
    );
  }
}