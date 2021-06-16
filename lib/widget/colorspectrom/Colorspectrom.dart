//1.render acolor spectrom
//2.recognise the color user select
//3.give color spectrom a shape
import 'package:flutter/material.dart';

class JolorSpectrom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.black])),
          child: SizedBox(),
        ),
      ),
    );
  }
}
