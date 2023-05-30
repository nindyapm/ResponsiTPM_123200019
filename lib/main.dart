import 'package:flutter/material.dart';
import 'package:responsi_123200019/views/menu_utama.dart';
import 'package:responsi_123200019/views/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.black),
      ),
      home: SigninPage(),
    );
  }
}
