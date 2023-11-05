import 'package:flutter/material.dart';
import 'package:police/model/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Item> itemsList = [
    Item(
        name: "Almarai Fresh Milk 1 Liter",
        price: 1.5,
        image:
            "https://prod-admin-images.s3.ap-south-1.amazonaws.com/pWVdUiFHtKGqyJxESltt/product/6281007040235.jpg"),
    Item(
        name: "Almarai Fresh Labneh 500g",
        price: 2.25,
        image:
            "https://jebnalak.com/cdn/shop/products/almarai-fresh-labneh-500g-857270_800x.jpg?v=1626527537"),
    Item(
        name: "Almarai Kashkaval Full Fat \nCheese 250g",
        price: 3.75,
        image:
            "https://jebnalak.com/cdn/shop/files/blackfridayoffers-2023-10-10T173032.548_800x.png?v=1696948247"),
    Item(
        name: "Almarai Treats Peach \nYoghurt 105g",
        price: 0.5,
        image:
            "https://jebnalak.com/cdn/shop/files/blackfridayoffers-2023-10-09T173525.489_800x.png?v=1696862135"),
    Item(
        name: "Almarai Treats Berries \nYoghurt 105g",
        price: 0.5,
        image:
            "https://jebnalak.com/cdn/shop/files/blackfridayoffers-2023-10-09T173633.611_800x.png?v=1696862198"),
    Item(
        name: "Almarai Processed Cheddar\nCheese 500g",
        price: 4.0,
        image:
            "https://jebnalak.com/cdn/shop/products/almarai-cheddar-cheese-spread-330989_1024x1024.jpg?v=1621947517"),
    Item(
        name: "Almarai Mango & Grape \nJuice 1.4 L",
        price: 2.5,
        image:
            "https://jebnalak.com/cdn/shop/products/image_ef5d0a9b-e051-4f13-ae2e-1005e03c1c45_800x.webp?v=1658986334"),
    Item(
        name: "Almarai Farm's Select Juice\nPineapple 1 Liter",
        price: 3.0,
        image:
            "https://jebnalak.com/cdn/shop/products/Untitled-2021-09-25T172527.511_1024x1024@2x.jpg?v=1632579973"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 61, 63),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 61, 63),
        title: const Text("Shoping App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  return tile(
                    context: context,
                    item: itemsList[index],
                  );
                }),
          ),
          Container(
            height: 100,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                children: [
                  footer(
                    title: "# of Item In Cart",
                    value: itemsQty().toString(),
                  ),
                  Expanded(child: Container()),
                  footer(
                      title: "Total Price",
                      value: itemsTotalPrice().toString()),
                  ElevatedButton(onPressed: () {}, child: Text("Check Out"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  int itemsQty() {
    int quantity = 0;
    for (int index = 0; index < itemsList.length; index++) {
      quantity = quantity + itemsList[index].qty;
    }
    return quantity;
  }

  double itemsTotalPrice() {
    double totalPrice = 0;
    for (int index = 0; index < itemsList.length; index++) {
      totalPrice = totalPrice + itemsList[index].qty * itemsList[index].price;
    }
    return totalPrice;
  }

  Widget footer({required String title, required String value}) {
    return Column(
      children: [
        Text(title),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget tile({required BuildContext context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(item.image, width: 85, height: 85)),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Text(item.name),
                    Text("${item.price} JD"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    if (item.qty == 0) {
                      return;
                    }
                    item.qty = item.qty - 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove)),
              Text(item.qty.toString()),
              IconButton(
                  onPressed: () {
                    item.qty = item.qty + 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
