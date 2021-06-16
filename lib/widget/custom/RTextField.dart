import "package:flutter/material.dart";

class RTextField extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final Widget child3;

  const RTextField({this.child1, this.child2, this.child3});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          border: Border.all(width: 3, color: Colors.grey)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[child1, child2, child3],
      ),
    );
  }
}
