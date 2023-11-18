import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderView extends StatelessWidget {
  final String totalAmount;
  const HeaderView({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMMM yyyy');

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: 370,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 35,
                ),
                Text(
                  "Today,  ${formatter.format(now)}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                const Icon(
                  Icons.search,
                  size: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "swaar/pizza3.png",
                  width: 140,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$$totalAmount",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "Pay >",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
