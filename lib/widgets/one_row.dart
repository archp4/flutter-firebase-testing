import 'package:flutter/material.dart';

Widget oneRow(String key, String value) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key),
        Text(value),
      ],
    ),
  );
}
