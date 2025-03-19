import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UandiScreen extends StatefulWidget {
  const UandiScreen({super.key});

  @override
  State<UandiScreen> createState() => _UandiScreenState();
}

class _UandiScreenState extends State<UandiScreen> {
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                  selectedDate: selectedDate,
                  onPressed : onHeartPressed,
              ),
              _Bottom()
            ],
          ),
        ),
      ),
    );
  }

  onHeartPressed (){
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  maximumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date){
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  dateOrder: DatePickerDateOrder.ymd
              ),
            ),
          );
        });
  }
}

class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    required this.selectedDate,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    return Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge
            ),
            Text(
                '우리 처음 만난 날',
                style: Theme.of(context).textTheme.displayMedium

            ),
            Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Gaegu'
                )
            ),
            IconButton(
              iconSize: 60,
              color: Colors.red,
              onPressed: onPressed,
              icon: Icon(
                  Icons.favorite
              ),
            ),
            Text(
                'D + ${now.difference(selectedDate).inDays+1}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700
                )
            )
          ],
        )
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset(
          'asset/img/ui.jpg',
          fit: BoxFit.cover,
        ),

      ),
    );
  }
}
