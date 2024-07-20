import 'package:flutter/material.dart';
import 'package:news_app/controller/news_detail_controller.dart';
import 'package:news_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) {
            return newsDetailProvider(selectedIndex: 0, name: 'general', URL: "");
          },
          )
      ],
      child: const MaterialApp(
        home: splash_screen(),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
