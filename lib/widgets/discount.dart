import 'package:flutter/material.dart';

class DisvountView extends StatelessWidget {
  final double offerPrice;
  const DisvountView({super.key, required this.offerPrice});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 20,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 70,
        height: 30,
        child: Center(
          child: Text(
            "\$$offerPrice OFF",
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
