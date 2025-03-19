import 'package:flutter/material.dart';
import 'package:test_proj1/screen/constraints_screen.dart';
import 'package:test_proj1/screen/home_screen.dart';
import 'package:test_proj1/screen/random_number_generator_screen.dart';
import 'package:test_proj1/screen/uandi_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(
      //   fontFamily: 'Gaegu',
      //   textTheme: TextTheme(
      //     displayLarge: TextStyle(
      //       color: Colors.white,
      //       fontSize: 80,
      //     ),
      //     displayMedium: TextStyle(
      //         color: Colors.blue,
      //         fontSize: 80,
      //     ),
      //     bodyLarge: TextStyle(
      //         color: Colors.pink,
      //         fontSize: 80,
      //     ),
      //     bodyMedium: TextStyle(
      //         color: Colors.orange,
      //         fontSize: 80,
      //     ),
      //   ),
      // ),
      home: RandomNumberGeneratorScreen(),

    )
  );
}

