// ignore_for_file: dead_code

import 'package:example/core.dart';
import 'package:flutter/material.dart';

class MainViewNavigationItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final double size;
  final int index;
  final Color? color;

  const MainViewNavigationItem({
    Key? key,
    required this.item,
    required this.size,
    required this.index,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(2.0),
          backgroundColor: color ?? Colors.orange[900],
        ),
        onPressed: () {
          Get.to(item["view"]);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${item["label"]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10.0,
              ),
            ),
            Text(
              "#${index + 1}",
              style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    return InkWell(
      onTap: () {
        Get.to(item["view"]);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Theme.of(context).primaryColor.withOpacity(0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${item["label"]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
