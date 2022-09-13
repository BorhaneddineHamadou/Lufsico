import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lufsico/history_page.dart';
import 'package:lufsico/test.dart';
import 'package:lufsico/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              "Improve your speaking skills !",
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RecordPage(),
                            ));
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: secondaryColor2,
                                border: Border.all(color: primaryColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        border: Border.all(color: primaryColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.all(15),
                                    //color: primaryColor,
                                    child: const AutoSizeText(
                                      "Record a new video",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: primaryTextColor),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Icon(
                                    size: 40,
                                    Icons.videocam,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text(
                            "Analyse my recordings",
                            style: TextStyle(
                                fontSize: 20, color: primaryTextColor),
                          ),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              border: Border.all(color: primaryColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Speaking tips",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("images/image1.png"),
                            Image.asset("images/image2.png"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                          builder: (context) => const RecordPage(),
                        ));
                      },
                      child: const Icon(Icons.camera,
                          color: primaryTextColor, size: 40)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ));
                      },
                      child: const Icon(Icons.restore,
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

class AppBarAp extends StatelessWidget {
  const AppBarAp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: const Icon(
            Icons.settings,
            size: 40,
            color: primaryColor,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/user.jpeg"))),
        ),
      ],
    );
  }
}
