import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchRight extends StatefulWidget {
  const SearchRight({super.key});

  @override
  State<SearchRight> createState() => _SearchRightState();
}

class _SearchRightState extends State<SearchRight> {
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width > 820 && MediaQuery.of(context).size.width <= 1220;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isTablet(context) ? 254.0 : 345.0,
      height: 80.0,
      decoration: const BoxDecoration(
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
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isTablet(context) ? "Full Time" : "Full Time Only",
                    style: const TextStyle(
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
                child: const Center(
                  child: Text("Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kumbh Sans",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
