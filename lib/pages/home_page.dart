import 'package:flutter/material.dart';
import 'package:flutter_watch_shop_ui/model/data_model.dart';
import 'package:flutter_watch_shop_ui/pages/details_page.dart';
import 'package:flutter_watch_shop_ui/styles/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<String> getListString = [
  "Trending",
  "Categories",
  "New collection",
  "Brand-New",
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    buildTextEasy({
      required String name,
      required Color color,
      required double fontSize,
      required FontWeight fontWeight,
    }) {
      return Text(
        name,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      );
    }

    Widget buildDeatureandProductsText() {
      return Padding(
        padding: const EdgeInsets.only(top: 29, left: 55),
        child: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextEasy(
                color: Colors.black38,
                fontSize: 25,
                fontWeight: FontWeight.normal,
                name: "Featured",
              ),
              buildTextEasy(
                color: ktextColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                name: "Products",
              ),
            ],
          ),
        ),
      );
    }

    buildRotateText({required String name}) {
      return Padding(
        padding:
            const EdgeInsets.only(top: 22, left: 10, bottom: 15, right: 15),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: ktextColor,
            ),
          ),
        ),
      );
    }

    buildColumnRotateText() {
      return Column(
        children: [
          buildRotateText(
            name: "Colors",
          ),
          buildRotateText(
            name: "Strap",
          ),
          buildRotateText(
            name: "Brand",
          ),
          buildRotateText(
            name: "Size",
          ),
        ],
      );
    }

    buildListImageView({required Size mq, required BuildContext context}) {
      return Expanded(
        child: Container(
          height: mq.height * 0.5 + 20,
          width: mq.width,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: getData.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: getData[index].title,
                        price: getData[index].price,
                        desc: getData[index].desc,
                        image: getData[index].image,
                        review: getData[index].review,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: mq.width * 0.6,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 20),
                            child: Container(
                              height: mq.height * 0.2,
                              child: getData[index].image,
                            ),
                          ),
                          Text(
                            getData[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ktextColor,
                              letterSpacing: 0.6,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                getData[index].price,
                                style: TextStyle(
                                  color: ktextColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                getData[index].review.toString(),
                                style: TextStyle(
                                  color: ktextColor,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: kamberColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color: ktextColor,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: ktextColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    buildIconBag() {
      return CircleAvatar(
        radius: 30,
        backgroundColor: ktextColor,
        child: Icon(
          Icons.shopping_bag,
          size: 35,
        ),
      );
    }

    buildSelectCategoryItem({required Size mq}) {
      return Expanded(
        child: Container(
          height: 60,
          width: mq.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getListString.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 15),
                  child: getListString[index] == getListString[0]
                      ? Text(
                          getListString[index],
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          getListString[index],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black38,
                          ),
                        ),
                );
              }),
        ),
      );
    }

    buildButtomPlace({required Size mq}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildIconBag(),
            SizedBox(
              width: 15,
            ),
            buildSelectCategoryItem(mq: mq),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kamberColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDeatureandProductsText(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                buildColumnRotateText(),
                buildListImageView(
                  context: context,
                  mq: mq,
                ),
              ],
            ),
            Spacer(),
            buildButtomPlace(mq: mq),
          ],
        ),
      ),
    );
  }
}
