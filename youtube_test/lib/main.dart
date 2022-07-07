import 'package:flutter/material.dart';
import 'package:youtube_test/main_screen.dart';

void main() {
  runApp(const MyApp());
}

//@CodeWithFlexz on Instagram

//AmirBayat0 on Github
//Programming with Flexz on Youtube

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
