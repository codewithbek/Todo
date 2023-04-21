import 'package:flutter/material.dart';
class CategoryModel {
  final String title;
  final Color color;
  final Color gridColor;
  final String iconPath;
  final int id;

  CategoryModel({
    required this.color,
    required this.gridColor,
    required this.iconPath,
    required this.id,
    required this.title,
  });
}
