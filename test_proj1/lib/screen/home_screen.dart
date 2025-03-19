import 'package:flutter/material.dart';
import 'dart:async';
class HomeScreen extends StatefulWidget{


  HomeScreen({super.key}){
  }

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer){
      int currentPage = pageController.page!.toInt();
      int nextPage = currentPage +  1;
      if (nextPage > 4){
        nextPage = 0;
      }
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds : 500),
        curve: Curves.easeInBack,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    if(timer != null){
      timer!.cancel;
    }
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1,2,3,4,5]
            .map((e)=>
            Image.asset(
          'asset/img/$e.jpg',
          fit: BoxFit.cover,
            )
        ).toList(),
      )
    );
  }

}
