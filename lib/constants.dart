import 'package:flutter/material.dart';

// #0A0A0B -  Very dark (mostly black) blue.
// #1c1c1c - very dark gray = card
// #EFB321 - vivid orange = like and burger
// #8b8b8c - grayish blue = text
// #6E6E6E - very dark gray = horizontal scroll
// #DEB654 - soft orange = macronutrients

import 'package:flutter/material.dart';

const Color kMostlyBlack = Color(0xff0A0A0B);
const Color kVeryDarkGray = Color(0xff1c1c1c);
const Color kVividOrange = Color(0xffEFB321);
const Color kGrayishBlue = Color(0xff8b8b8c);
const Color kDarkGray = Color(0xff6E6E6E);
const Color kSoftOrange = Color(0xffDEB654);


var kInputDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search, color: kVividOrange, size: 25.0,),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: kMostlyBlack,
  filled: true,
  isDense: true,
  contentPadding: EdgeInsets.all(5),
  border: OutlineInputBorder(
    borderRadius:  BorderRadius.circular(30.0),
    borderSide: BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  labelText: 'Search your favorite recipe',
);