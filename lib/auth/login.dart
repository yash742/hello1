import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(),
                  ),
                  RaisedButton(child: Text("submit code"), onPressed: null),
                  RaisedButton(child: Text("go back"), onPressed: null)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
