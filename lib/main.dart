import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lufsico/first_page.dart';
import 'package:lufsico/test.dart';
import 'package:lufsico/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getMaterialcolor(primaryColor.value),
        fontFamily: "Gugi",
      ),
      home: FirstPage(),
    );
  }
}
