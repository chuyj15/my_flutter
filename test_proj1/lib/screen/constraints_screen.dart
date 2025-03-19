import 'package:flutter/material.dart';

class ConstraintsScreen extends StatelessWidget {
  const ConstraintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Align(
            alignment : Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
