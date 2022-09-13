import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lufsico/home_page.dart';
import 'package:lufsico/theme.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final controllerPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryColor, secondaryColor],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: LogoWidget(),
            ),
            Expanded(
              child: PageView(
                controller: controllerPage,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Enter your name",
                              style: TextStyle(
                                  color: primaryTextColor, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtonFirst(
                              text: "Add name",
                              onPress: () {
                                controllerPage.animateToPage(1,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "You already have an ",
                                    style: TextStyle(
                                        color: primaryTextColor, fontSize: 15),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      "account",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryTextColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ButtonFirst(
                                text: "Login",
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,

                            fillColor: Color(0xffd9d9d9),
                            hintText: "Enter your name",
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonFirst(
                        text: "entry",
                        onPress: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/logo.png"),
        const Text(
          "Lufsico",
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 30),
        ),
      ],
    );
  }
}

class ButtonFirst extends StatelessWidget {
  const ButtonFirst({
    required this.text,
    required this.onPress,
    Key? key,
  }) : super(key: key);
  final String text;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(color: primaryColor, fontSize: 20),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)))),
        backgroundColor: MaterialStateProperty.all(const Color(0xffd9d9d9)),
      ),
    );
  }
}
