import 'package:flutter/material.dart';
import 'package:to_do/View/homescreen.dart';

void main() async {
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
        );
  }
}
