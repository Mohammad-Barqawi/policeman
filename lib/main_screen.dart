import 'package:flutter/material.dart';
import 'package:police/add_to_cart.dart';
import 'package:police/model/item.dart';
import 'package:police/widgets/chart.dart';
import 'package:police/widgets/discount.dart';
import 'package:police/widgets/filter.dart';
import 'package:police/widgets/header.dart';
import 'package:police/widgets/qty.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Item> itemList = [
    Item(
      offerPrice: 2.1,
      image: "swaar/pizza1.png",
      name: "White Chicken",
      descripton: "Spicy Chicken",
      rate: 4.8,
      kcal: 510,
      price: 18.99,
      proteins: "16,2",
      carbs: "13,9",
      fibre: "8,6",
    ),
    Item(
      offerPrice: 0.0,
      image: "swaar/pizza2.png",
      name: "Original Italian",
      descripton: "Buffalo mozzarella",
      rate: 3.9,
      kcal: 436,
      price: 12.58,
      proteins: "11,8",
      carbs: "21,3",
      fibre: "6,4",
    ),
    Item(
      offerPrice: 5.0,
      image: "swaar/pizza4.png",
      name: "Meat Mexican",
      descripton: "Grounded Beef Tacos",
      rate: 4.2,
      kcal: 312,
      price: 10.99,
      proteins: "10,8",
      carbs: "18,9",
      fibre: "7,2",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            HeaderView(totalAmount: itemsTotalPrice().toStringAsFixed(2)),
            // HeaderView(price: totalPrice().toStringAsFixed(2)),
            const FilterView(),
            Expanded(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return tile(
                      context: context,
                      item: itemList[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

// int itemsQty() {
//   int quantity = 0;
//   for (int index = 0; index < itemsList.length; index++) {
//     quantity = quantity + itemsList[index].qty;
//   }
//   return quantity;
// }

  double itemsTotalPrice() {
    double totalPrice = 0;
    for (int index = 0; index < itemList.length; index++) {
      totalPrice = totalPrice + itemList[index].qty * itemList[index].price;
    }
    return totalPrice;
  }

  Widget tile({required BuildContext context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 10, right: 25, top: 10),
      child: Container(
        width: 150,
        height: 150,
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
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Image.asset(
                  item.image,
                  width: 150,
                ),
                item.qty > 0 ? QtyView(qty: item.qty) : Container(),
                item.offerPrice > 0
                    ? DisvountView(offerPrice: item.offerPrice)
                    : Container()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 5),
                Text(
                  item.descripton,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      "swaar/star.png",
                      width: 20,
                    ),
                    Text(
                      "  ${item.rate.toString()}",
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AddToCartView(
                  price: item.price,
                  qty: item.qty,
                  onMinus: () {
                    item.qty = item.qty - 1;
                    setState(() {});
                  },
                  onPlus: () {
                    item.qty = item.qty + 1;
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  chartView(kcal: item.kcal),
                  const Text(
                    "Proteins",
                    style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        item.proteins,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const Text(
                        "  gr",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  const Text(
                    "Carbohydrate",
                    style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        item.carbs,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const Text(
                        "  gr",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  const Text(
                    "Fibre",
                    style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        item.fibre,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const Text(
                        "   gr",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
