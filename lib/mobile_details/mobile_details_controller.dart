import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
class MobileDetailsController extends GetxController {

  String data = "";
  List<Map<String, dynamic>> rightList = [{
    "topic": "Flutter & Dart - The Complete Guide [2023 Edition]",
    "description": "  A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps",
    "lastUpdate": "11/2022",
    "languages": "English",
    "price": "4567",
    "courseDetails": {
      "Introduction": {},
      "Flutter Basics": {},
      "Running Apps": {},
      "Widgets": {},
      5: "Introduction",
      6: "Introduction",
      7: "Introduction",
      8: "Introduction",
      9: "Introduction",
      10: "Introduction",
      11: "Introduction"
    }
  }
  ];
  List leftList = [];

  int score(String text) {
    Map<String, int> alphabets = {
      "a": 1,
      "b": 3,
      "c": 3,
      "d": 2,
      "e": 1,
      "f": 4,
      "g": 2,
      "h": 4,
      "i": 1,
      "j": 8,
      "k": 5,
      "l": 1,
      "m": 3,
      "n": 1,
      "o": 1,
      "p": 3,
      "q": 10,
      "r": 1,
      "s": 1,
      "t": 1,
      "u": 1,
      "v": 4,
      "w": 4,
      "x": 8,
      "y": 4,
      "z": 10
    };


    int _score = 0;
    List<String> letters = text.split("");
    for (var letter in letters) {
      _score += alphabets[letter.toLowerCase()]!;
    }
    print("object   $_score");
    var bvvvb = "jhgjh";

    return _score;
  }

  bool isArmstrongNumber(String number) {
    int total = 0;
    List<String> letters = number.split("");
    for (var letter in letters) {
      int ii = int.parse(math.pow(int.parse(letter), number.length).toString());
      total += ii;
    }
    print("Object number...${total == number}");
    return total == number;
  }



}