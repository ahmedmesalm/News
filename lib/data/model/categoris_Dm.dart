import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryDm{
  String id ;
  String title ;
  String imagepath ;
  bool isleftside ;
  Color backgroundcolor ;

  CategoryDm({required this.title , required this.id ,
  required this.backgroundcolor , required this.isleftside,
    required this.imagepath});

  static List<CategoryDm> categories =[
    CategoryDm(title: "Sports", id: "sports", backgroundcolor:Colors.red,
        isleftside: true, imagepath: "assets/ball.png"),
    CategoryDm(title: "Health", id: "health", backgroundcolor: Color(0xff003E90),
        isleftside: true, imagepath: "assets/health.png"),
    CategoryDm(title: "Technology", id: "technology", backgroundcolor: Colors.cyan,
        isleftside: true, imagepath: "assets/Politics.png"),
    CategoryDm(title: "Business", id: "business",
        backgroundcolor:Colors.orangeAccent,
        isleftside: true, imagepath:"assets/bussines.png"),
    CategoryDm(title: "Science", id: "science", backgroundcolor:Colors.purple,
        isleftside: true, imagepath: "assets/science.png"),
    CategoryDm(title: "Enviroment", id: "enviroment",
        backgroundcolor: Colors.black12,
        isleftside: true, imagepath: "assets/environment.png"),
    ];
}