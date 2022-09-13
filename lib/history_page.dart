import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lufsico/home_page.dart';
import 'package:lufsico/test.dart';
import 'package:lufsico/theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            const AppBarAp(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Hey ,Borhaneddine 👋",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You Can analyse all your recordings !",
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset("images/photo.png"),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 16, top: 10, bottom: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Test rec ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          RatingBarIndicator(
                            rating: 2,
                            itemCount: 3,
                            itemSize: 20.0,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.delete,
                            color: primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RecordPage(),
                        ));
                      },
                      child: const Icon(Icons.camera,
                          color: primaryTextColor, size: 40)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      child: const Icon(Icons.home,
                          color: primaryTextColor, size: 40)),
                  GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.notifications_on,
                          color: primaryTextColor, size: 40)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            )
          ],
        ),
      ),
    );
  }
}
