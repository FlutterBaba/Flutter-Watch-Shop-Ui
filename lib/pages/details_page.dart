import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_watch_shop_ui/styles/app_colors.dart';

TextStyle _textStyle1 = TextStyle(
  fontSize: 21,
  letterSpacing: 1.2,
  color: ktextColor,
  fontWeight: FontWeight.bold,
);

TextStyle _textStyle2 = TextStyle(
  fontSize: 18,
  letterSpacing: 1.2,
  color: ktextColor,
  fontWeight: FontWeight.bold,
);
TextStyle _textStyle3 = TextStyle(
  fontSize: 18,
  letterSpacing: 0.9,
  color: ktextColor,
);

class DetailPage extends StatefulWidget {
  final String title;
  final String price;
  final String desc;
  final Image image;
  final double review;

  const DetailPage({
    Key? key,
    required this.title,
    required this.price,
    required this.desc,
    required this.image,
    required this.review,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    buildCancelicon(BuildContext context) {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear),
      );
    }

    buildImage(Size mq) {
      return Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
          child: Container(
            height: mq.height * 0.3,
            child: widget.image,
          ),
        ),
      );
    }

    buildTitletext() {
      return Text(
        widget.title,
        style: _textStyle1,
      );
    }

    buildPrice() {
      return Text(
        widget.price,
        style: _textStyle2,
      );
    }

    buildDesc() {
      return Text(
        widget.desc,
        style: _textStyle3,
      );
    }

    buildRatingReview() {
      return Row(
        children: [
          Text(
            "Reviews",
            style: _textStyle2,
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            widget.review.toString(),
            style: _textStyle2,
          ),
          Icon(
            Icons.star,
            color: kamberColor,
          ),
        ],
      );
    }

    buildCartandLikes() {
      return Row(
        children: [
          Text(
            "Add to cart",
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 0.6,
              color: ktextColor,
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: ktextColor,
            radius: 30,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: kamberColor,
                size: 30,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCancelicon(context),
                buildImage(mq),
                buildTitletext(),
                SizedBox(
                  height: 12.0,
                ),
                buildPrice(),
                SizedBox(
                  height: 15.0,
                ),
                buildDesc(),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                buildRatingReview(),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                buildCartandLikes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
