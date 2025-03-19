import 'package:flutter/material.dart';
import 'package:test_proj1/constant/color.dart';
import 'dart:math';

class RandomNumberGeneratorScreen extends StatefulWidget {

  const RandomNumberGeneratorScreen({super.key});

  @override
  State<RandomNumberGeneratorScreen> createState() => _RandomNumberGeneratorScreenState();
}

class _RandomNumberGeneratorScreenState extends State<RandomNumberGeneratorScreen> {

  List<int> numbers = [123,456,789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(),
              _Body(numbers : numbers),
              _Footer(onPressed: generateRandomNumber),
            ],
          ),
        ),
      ),
    );
  }

  generateRandomNumber(){
    setState(() {
      final rand = Random();
      final Set<int> newNumbers = {}; //set :중복되는 값이 안들어감
      while(newNumbers.length<3){
        final randomNumber = rand.nextInt(1000);
        newNumbers.add(randomNumber);
      }
      numbers = newNumbers.toList();
    });

    print('click');
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700),
        ),
        IconButton(
          color: redColor,
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  final List<int> numbers;

  const _Body({
    required this.numbers,
    super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.numbers.map(
            (e)=> e.toString().split('')).map(
            (e)=> Row(
              children: e.map(
                  (number) => Image.asset(
                    'asset/img/$number.png',
                    width: 50,
                    height: 70,
                  ),
              ).toList(),
            ),
        ).toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text('생성하기!'),
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          foregroundColor: Colors.white,
        )
    );
  }
}