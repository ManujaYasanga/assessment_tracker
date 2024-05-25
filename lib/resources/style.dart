import 'package:assessment_tracker/resources/colors.dart';
import 'package:flutter/material.dart';

const inputFieldDecoration = InputDecoration(
  hintText: "Email",
  filled: false,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: green),
      borderRadius: BorderRadius.all(Radius.circular(100))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: green2),
      borderRadius: BorderRadius.all(Radius.circular(100))),
);

final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
