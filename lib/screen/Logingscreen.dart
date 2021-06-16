import 'package:ambross/auth/Authform.dart';
import 'package:flutter/material.dart';

class Authscreen extends StatefulWidget {
  @override
  _AuthscreenState createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  String title = " AUTH SCREEN";

  void _submitform(
      String username, String email, String passward, bool islogin) {
    if (islogin) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitform),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5,
        backgroundColor: Colors.white70,
        tooltip: "message to us",
        child: Icon(Icons.message),
      ),
    );
  }
}
