import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const roundedButton({super.key, required this.title, required this.onTap, this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        margin:const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(child:loading? const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) :
         Text(title, style:const TextStyle(
          color: Colors.white
        ),),),
      ),
    );
  }
}