import 'package:flutter/material.dart';

class Cta extends StatelessWidget {
  const Cta({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
            height: 96.0,
            color: Colors.white,
            child: Center(
              child: Container(
                  width: 327.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5964E0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kumbh Sans",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            )));
  }
}
