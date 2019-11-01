import 'package:flutter/material.dart';
import './ui/Home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'BMI Calculator',
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}