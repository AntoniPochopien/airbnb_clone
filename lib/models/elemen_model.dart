import 'package:flutter/material.dart';

class ElementModel {
  int id;
  String name;
  double opinion;
  double price;
  List<Image> images;
  bool isFav;

  ElementModel(
      {required this.id,
      required this.name,
      required this.opinion,
      required this.price,
      required this.images,
      required this.isFav});
}
