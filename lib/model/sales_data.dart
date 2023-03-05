import 'package:flutter/material.dart';

class SalesData {
  SalesData({
    required this.year,
    required this.sales,
    this.color,
  });
  final String year;
  final double sales;
  final Color? color;
}
