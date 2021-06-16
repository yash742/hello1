import 'package:flutter/material.dart';

class Droping extends StatefulWidget {
  @override
  _DropingState createState() => _DropingState();
}

class _DropingState extends State<Droping> {
  String allvalues;
  List dropingItems = ["chapter1", "chapter2", "chapter3", "chapter4"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            width: size.width * 0.75,
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButton(
                value: allvalues,
                icon: Icon(Icons.arrow_drop_down),
                style: TextStyle(color: Colors.black, fontSize: 22.5),
                iconSize: 30,
                hint: Text("select a chapter"),
                dropdownColor: Colors.white70,
                isExpanded: true,
                items: dropingItems.map((e) {
                  return DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Icon(Icons.check_box),
                          SizedBox(
                            width: 20,
                          ),
                          Text(e),
                        ],
                      ));
                }).toList(),
                onChanged: (newvalue) {
                  setState(() {
                    allvalues = newvalue;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
