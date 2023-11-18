import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: Row(
        children: [
          const Text(
            "Pizza",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(child: Container()),
          const Row(
            children: [
              Text(
                "Max Price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Icon(Icons.arrow_drop_down_rounded)
            ],
          ),
        ],
      ),
    );
  }
}
