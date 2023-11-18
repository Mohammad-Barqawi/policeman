import 'package:flutter/material.dart';

class AddToCartView extends StatelessWidget {
  final double price;
  final int qty;
  final Function() onMinus;
  final Function() onPlus;

  const AddToCartView(
      {super.key,
      required this.price,
      required this.qty,
      required this.onMinus,
      required this.onPlus});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        qty > 0
            ? GestureDetector(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.remove, size: 20),
                  ),
                ),
                onTap: () {
                  onMinus();
                },
              )
            : Container(
                width: 25,
              ),
        const SizedBox(width: 5),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFFF2FBFF),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  qty > 0
                      ? "\$ ${(price * qty).toStringAsFixed(2)}"
                      : "\$ ${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    onPlus();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
