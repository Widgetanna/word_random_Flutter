
import 'package:flutter/material.dart';

class ScrollManager {
  static final FixedExtentScrollController scroll =
      FixedExtentScrollController(initialItem: 0);
   static List nextIndex = []; 
  static void resetScroll() {
    scroll.jumpToItem(0);
   }
}