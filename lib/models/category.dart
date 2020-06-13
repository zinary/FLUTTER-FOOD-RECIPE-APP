import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Category {
  final String id;
  final String title;
  final Color color;

 const Category({
    this.color =Colors.pink,
   @required this.id,
   @required this.title,
  });
}
