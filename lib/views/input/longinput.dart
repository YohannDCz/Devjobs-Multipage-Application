import 'package:flutter/material.dart';

import 'longinput_left.dart';
import 'longinput_middle.dart';
import 'longinput_right.dart';

class LongInputContent extends StatefulWidget {
  const LongInputContent({
    super.key,
    required this.search,
  });

  final void Function(String) search;

  @override
  State<LongInputContent> createState() => _LongInputContentState();
}

class _LongInputContentState extends State<LongInputContent> {
  bool isChecked = false;

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 820;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 1220;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SearchLeft(
        search: widget.search,
      ),
      const SearchMiddle(),
      const SearchRight(),
    ]);
  }
}
