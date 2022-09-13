import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lufsico/home_page.dart';
import 'package:lufsico/theme.dart';

class ReslutPage extends StatelessWidget {
  const ReslutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: AppBarAp(),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "images/photo2.png",
            fit: BoxFit.fitWidth,
          ),
          Container(
            height: 25,
            color: primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
          )
        ],
      ),
    );
  }
}
