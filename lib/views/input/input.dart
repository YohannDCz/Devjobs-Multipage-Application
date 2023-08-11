import 'package:flutter/material.dart';

import 'shortinput.dart';
import 'longinput.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.search,
  });

  final void Function(String) search;

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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ShortInputContent(
                  search: search,
                ),
              ),
            if (isTablet(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: LongInputContent(
                  search: search,
                ),
              ),
            if (isDesktop(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 165),
                child: LongInputContent(
                  search: search,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
