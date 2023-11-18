import 'package:flutter/material.dart';

class QtyView extends StatelessWidget {
  final int qty;
  const QtyView({super.key, required this.qty});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 35,
        height: 35,
        child: Center(
          child: Text(
            "$qty",
            // item.qty.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
