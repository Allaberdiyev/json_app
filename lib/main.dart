import 'package:flutter/material.dart';
import 'package:json/views/screens/homescreen.dart';

void main(List<String> args) {
  runApp(Json());
}

class Json extends StatelessWidget {
  const Json({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
