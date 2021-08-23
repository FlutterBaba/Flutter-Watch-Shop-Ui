import 'package:flutter/cupertino.dart';

class Data {
  String title;
  String price;
  String desc;
  Image image;
  double review;

  Data({
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
    required this.review,
  });
}

List<Data> getData = [
  Data(
    title: "Koppel 45MM",
    desc:
        "Henning Koppel showed on early talent for art,leading him to train in both drawing and aquarelle early on.He continued studies...",
    price: "\$350",
    review: 3.8,
    image: Image.asset(
      "assets/watch_two.png",
      fit: BoxFit.cover,
    ),
  ),
  Data(
    title: "Citizen Eco",
    desc:
        "Adjustable black & brown 20 millimeter genuine leather and fabric strap fits up to 8-inch wrist circumference. Black dial with full Arabic numerals; Date window at 3 o'clock; 24-hour military time",
    price: "\$350",
    review: 3.8,
    image: Image.asset(
      "assets/watch_one.png",
      fit: BoxFit.cover,
    ),
  ),
  Data(
    title: "MIDO - Men's Watch",
    desc:
        "Silver-tone dial with date and day display, Brushed and polished stainless steel band and Swiss Automatic chronometer movement.",
    price: "\$350",
    review: 3.6,
    image: Image.asset(
      "assets/watch_three.png",
      fit: BoxFit.cover,
    ),
  ),
];
