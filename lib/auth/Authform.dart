import 'package:ambross/widget/custom/RTextField.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitfn);
  final void Function(
      String username, String email, String password, bool islogin) submitfn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  var _islogin = true;
  var _username = "";
  var _user_email = "";
  var _user_passward = "";
  final _formkey = GlobalKey<FormState>();
  void _trysubmit() {
    final bool isvald = _formkey.currentState.validate();
    if (isvald) {
      FocusScope.of(context).unfocus();
      _formkey.currentState.save();
      //ttrigger the on saved
      widget.submitfn(_username, _user_email, _user_passward, _islogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  if (!_islogin)
                    RTextField(
                      child1: Icon(Icons.person),
                      child2: Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "user name is empty";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _username =
                                newValue; //no need to call set state bcz no change on the ui
                          },
                        ),
                      ),
                      child3: Icon(Icons.verified_user,
                          color:
                              !_username.isEmpty ? Colors.green : Colors.grey),
                    ),
                  SizedBox(height: 10),
                  RTextField(
                    child1: Icon(Icons.email),
                    child2: Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email or Phone",
                            labelStyle: TextStyle(fontSize: 20)),
                        cursorRadius: Radius.zero,
                        validator: (value) {
                          if (value.isEmpty || !value.contains("@")) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    child3: Icon(Icons.verified_user),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: FlatButton(
                        onPressed: () {}, child: Text("Recover Password")),
                  ),
                  RTextField(
                    child1: Icon(Icons.lock),
                    child2: Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "passward",
                            labelStyle: TextStyle(fontSize: 20)),
                        obscureText: true,
                      ),
                    ),
                    child3: Icon(Icons.visibility),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: _trysubmit,
                    child: Container(
                      width: size.width * 0.9,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green),
                      child: Center(
                        child: Icon(Icons.done),
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          _islogin = !_islogin;
                        });
                      },
                      child: _islogin
                          ? Text('create new accound')
                          : Text("I have an account")),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(onPressed: () {}))
                ],
              )),
        ),
      ),
    );
  }
}
