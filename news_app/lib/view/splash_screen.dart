import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/home_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds:2), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const home_screen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_pic.jpg",
            fit: BoxFit.cover,
            height: height * .5,
            ),

            SizedBox(height: height * 0.04),

            Text("TOP HEADLINES",
            style: GoogleFonts.anton(
              letterSpacing:.6,
              color:Colors.grey.shade700
            ),),

            SizedBox(height: height * 0.04),

            const SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
    );
  }
}