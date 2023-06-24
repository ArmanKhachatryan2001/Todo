import 'dart:math';
import 'package:flutter/material.dart';

class GetColor {
  static Color? getColor(int index) {
    List<Color?> colors = [
      Colors.red[300],
      Colors.blue[300],
      Colors.green[300],
      Colors.yellow[300],
      Colors.orange[300],
      Colors.purple[300],
      Colors.teal[300],
      Colors.pink[300],
      Colors.indigo[300],
      Colors.amber[300],
      Colors.cyan[300],
      Colors.deepPurple[300],
      Colors.lime[300],
      Colors.brown[300],
      Colors.grey[300],
      Colors.lightGreen[300],
      Colors.deepOrange[300],
      Colors.blueGrey[300],
    ];
    final random = Random();
    final randomIndex = random.nextInt(
      colors.length,
    );
    return colors[randomIndex];
  }
}
