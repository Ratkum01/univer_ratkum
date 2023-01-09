import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maneg_ratkum/screens/hompage.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Maneger UI",
      home: const HomePage(),
    );
  }
}