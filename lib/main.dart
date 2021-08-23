import 'package:flutter/material.dart';
import 'pages/home_page.dart';
void main() {
  runApp(MyApp());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor:kamberColor,
  //   systemNavigationBarColor: kamberColor,
  // ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Watch Shop UI ",
      home: HomePage(),
    );
  }
}
