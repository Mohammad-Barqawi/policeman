class Item {
  final double offerPrice;
  final String image;
  final String name;
  final String descripton;
  final double rate;
  final int kcal;
  final double price;
  final String proteins;
  final String carbs;
  final String fibre;
  int qty;

  Item(
      {required this.offerPrice,
      required this.image,
      required this.name,
      required this.price,
      required this.descripton,
      required this.rate,
      required this.kcal,
      required this.proteins,
      required this.carbs,
      required this.fibre,
      this.qty = 0});
}
