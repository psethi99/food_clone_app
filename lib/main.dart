import 'package:flutter/material.dart';
import 'package:food_app/view/Restaurant.dart';
//import 'shared/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiggyUI',
      debugShowCheckedModeBanner: false,
      //theme: appPrimaryTheme(),
      home: const RestaurantScreen(),
    );
  }
}