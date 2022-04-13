import 'package:flutter/material.dart';

class Utils {
  static Color? switchColor(int index) {
    switch(index) {
      case 0: return Colors.green.shade700;
      case 1: return Colors.redAccent;
      case 2: return Colors.yellowAccent;
      case 3: return Colors.blueAccent;
      case 4: return Colors.orangeAccent;
      case 5: return Colors.purpleAccent;
      case 6: return Colors.greenAccent;
    }
    return null;
  }

}