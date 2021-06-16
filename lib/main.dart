import 'package:ambross/auth/Authform.dart';
import 'package:ambross/screen/a.dart';
import 'package:ambross/screen/asecond.dart';
import 'package:ambross/widget/drop.dart';

import 'package:flutter/material.dart';
import 'package:ambross/screen/Logingscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // accentColor: Colors.green,
        //accentColorBrightness: Brightness.dark,
        backgroundColor: Colors.white,
        // primarySwatch: Colors.blue,
        // buttonTheme: ButtonTheme.of(context).copyWith(),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Droping(),
    );
  }
}
