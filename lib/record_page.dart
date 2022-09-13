import 'package:flutter/material.dart';
import 'package:lufsico/home_page.dart';
import 'package:lufsico/result_page.dart';
import 'package:lufsico/theme.dart';

class RecordPage2 extends StatefulWidget {
  const RecordPage2({Key? key}) : super(key: key);

  @override
  _RecordPage2State createState() => _RecordPage2State();
}

class _RecordPage2State extends State<RecordPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          // children: ,
          ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReslutPage(),
                ));
              },
              child: const Icon(Icons.model_training,
                  color: primaryTextColor, size: 40)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              },
              child: const Icon(Icons.home, color: primaryTextColor, size: 40)),
          GestureDetector(
              onTap: () {
                // Navigator.of(context).pop();
              },
              child: const Icon(Icons.notifications_on,
                  color: primaryTextColor, size: 40)),
        ],
      ),
    );
  }
}
