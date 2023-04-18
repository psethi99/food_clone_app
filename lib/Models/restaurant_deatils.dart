import 'package:flutter/material.dart';

class RestaurantDetail {
  const RestaurantDetail({
    required this.title,
    required this.price,
    this.image = '',
  });

  final String title;
  final String price;
  final String image;

  static const cakes = [
    RestaurantDetail(
      title: 'Rasmalai Cake',
      price: '₹459',
      image: 'food_app/assets/images/food1.jpg',
    ),
    RestaurantDetail(
      title: 'Vanilla Gulab Jamun Cake',
      image: 'assets/images/food2.jpg',
      price: '₹389',
    ),
    RestaurantDetail(
      title: 'Butterscotch Cake',
      image: 'assets/images/food3.jpg',
      price: '₹399',
    ),
    RestaurantDetail(
      title: 'Rasmalai Mini Jar Cake',
      image: 'assets/images/food4.jpg',
      price: '₹139',
    ),
    RestaurantDetail(
      title: 'Podi Idly(2Pcs)',
      image: 'assets/images/food5.jpg',
      price: '₹110',
    ),
    RestaurantDetail(
      title: 'Mini Idly with Sambar',
      image: 'assets/images/food6.jpg',
      price: '₹85',
    ),
  ];
}